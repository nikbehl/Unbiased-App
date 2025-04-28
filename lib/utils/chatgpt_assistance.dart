// Updated chatgpt_assistance.dart

import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/utils/grokcloud.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';
import 'package:frontend_dev_guide/utils/ai_content_parser.dart';

// Enum to specify the context of the AI assistant
enum AssistantContext { frontend, backend }

class Chatgpt extends StatefulWidget {
  final AssistantContext context;

  // Add context parameter with frontend as default
  const Chatgpt({Key? key, this.context = AssistantContext.frontend})
      : super(key: key);

  @override
  _ChatgptState createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  String selectedModel = "gpt-3.5-turbo";

  // Lists of technologies to recognize in chat
  // Frontend tech items
  final List<String> _frontendTechItems = [
    'HTML5',
    'CSS3',
    'JavaScript',
    'TypeScript',
    'React',
    'Angular',
    'Vue.js',
    'Svelte',
    'Next.js',
    'Redux',
    'MobX',
    'GraphQL',
    'REST API',
    'REST',
    'Tailwind CSS',
    'Tailwind',
    'Styled Components',
    'Webpack',
    'Vite',
    'Jest',
    'Cypress',
    'Git',
    'GitHub',
    'Node.js',
    'Node',
    'Express',
    'PWA',
    'Web Components',
    'HTML',
    'CSS',
    'JS',
    'TS',
  ];

  // Backend tech items
  final List<String> _backendTechItems = [
    'Node.js',
    'Express',
    'Django',
    'Flask',
    'Spring Boot',
    'ASP.NET Core',
    'Laravel',
    'Ruby on Rails',
    'NestJS',
    'PostgreSQL',
    'MongoDB',
    'MySQL',
    'Redis',
    'GraphQL',
    'REST API',
    'REST',
    'gRPC',
    'Microservices',
    'Docker',
    'Kubernetes',
    'AWS',
    'Azure',
    'Google Cloud',
    'JWT',
    'OAuth',
    'WebSockets',
    'Message Queues',
    'RabbitMQ',
    'Kafka',
    'Python',
    'Java',
    'C#',
    'Go',
    'Rust',
    'Node',
    'Express'
  ];

  @override
  void initState() {
    super.initState();
    fetchModels();

    // Add context-specific welcome message
    _messages.add(
      ChatMessage(
        text: widget.context == AssistantContext.frontend
            ? "Welcome to the AI Assistant! Ask me about any frontend technology like 'What is React?' or 'Explain TypeScript'."
            : "Welcome to the AI Assistant! Ask me about any backend technology like 'What is Node.js?' or 'Explain PostgreSQL'.",
        isUser: false,
      ),
    );
  }

  Future<void> fetchModels() async {
    final models = await getAvailableModels();
    if (models != null && models.models.isNotEmpty) {
      setState(() {
        selectedModel = models.models.first.id;
      });
    }
  }

  Future<void> handleSubmitted(String text) async {
    if (text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _messages.add(ChatMessage(text: text, isUser: true));
    });

    _textController.clear();
    _scrollToBottom();

    // Context-specific tech matching
    List<String> techItemsToCheck = widget.context == AssistantContext.frontend
        ? _frontendTechItems
        : _backendTechItems;

    // Find tech match
    String? techMatch = _findTechInQuery(text, techItemsToCheck);
    String techToUse = techMatch ?? _extractMainTopic(text);

    debugPrint("Using technology: $techToUse for navigation");

    // Format prompt based on context
    String contextPrefix =
        widget.context == AssistantContext.frontend ? "frontend" : "backend";

    String prompt =
        "Please provide detailed information about $techToUse in $contextPrefix development. "
        "Format your answer with these sections:\n"
        "Description: [Explain what $techToUse is and its importance in $contextPrefix development]\n"
        "Code Example: [Show a simple code example using $techToUse]\n"
        "Resources: [List 3-5 useful resources for learning $techToUse]";

    try {
      final response = await sendPostPrompt(prompt, selectedModel);

      if (response != null && response.choices.isNotEmpty) {
        String cleanedResponse = response.choices.first.message.content
            .replaceAll(RegExp(r'<\/?think>'), '')
            .trim();

        // For UI feedback, add the response but don't need to wait
        setState(() {
          _messages.add(ChatMessage(
            text: "Navigating to details for '$techToUse'...",
            isUser: false,
          ));
          _isLoading = false;
        });

        _scrollToBottom();

        // Parse the AI response
        final parsedContent = AiContentParser.parseAIResponse(cleanedResponse);

        // Navigate to detail page with minimal delay
        if (mounted) {
          Future.microtask(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  title: techToUse,
                  category: _getCategoryForTech(techToUse, widget.context),
                  aiDescription: parsedContent['description'] as String,
                  aiCodeExample: parsedContent['codeExample'] as String,
                  aiResources:
                      List<String>.from(parsedContent['resources'] as List),
                  loadFromAi: false, // We already have the AI content
                ),
              ),
            );
            debugPrint("Navigation executed to detail page for $techToUse");
          });
        }
      } else {
        setState(() {
          _messages.add(const ChatMessage(
            text:
                "I'm sorry, I couldn't process your request. Please try again.",
            isUser: false,
          ));
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error in AI request: $e");
      setState(() {
        _messages.add(ChatMessage(
          text: "I'm sorry, there was an error: $e",
          isUser: false,
        ));
        _isLoading = false;
      });
    }
  }

  // Extract the main topic from a query if no direct tech match is found
  String _extractMainTopic(String query) {
    // Remove question words and common phrases
    query = query
        .toLowerCase()
        .replaceAll(RegExp(r'what is|how to|explain|tell me about|learn'), '')
        .trim();

    // Check if it starts with prepositions
    query = query.replaceAll(RegExp(r'^(the|a|an)\s+'), '').trim();

    // Remove any trailing punctuation
    query = query.replaceAll(RegExp(r'[?.!,]$'), '').trim();

    // If the query is now very short, use the original text
    if (query.length < 3) {
      return query;
    }

    // If we have multiple words, take the first few as the likely topic
    final words = query.split(' ');
    if (words.length > 3) {
      return words.take(3).join(' ');
    }

    return query;
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Find if query is asking about a specific technology
  String? _findTechInQuery(String query, List<String> techItems) {
    query = query.toLowerCase();

    // Look for technology matches - case insensitive
    for (var tech in techItems) {
      if (query.contains(tech.toLowerCase())) {
        debugPrint("Found tech match: $tech");
        return tech;
      }
    }

    return null;
  }

  // Get the category for a technology based on context
  String _getCategoryForTech(String tech, AssistantContext context) {
    final techLower = tech.toLowerCase();

    if (context == AssistantContext.frontend) {
      // Frontend categories
      if (techLower.contains('html') ||
          techLower.contains('css') ||
          techLower.contains('javascript') ||
          techLower.contains('typescript') ||
          techLower == 'js' ||
          techLower == 'ts') {
        return 'Language';
      } else if (techLower.contains('react') ||
          techLower.contains('angular') ||
          techLower.contains('vue') ||
          techLower.contains('svelte') ||
          techLower.contains('next')) {
        return 'Framework';
      } else if (techLower.contains('redux') || techLower.contains('mobx')) {
        return 'State Management';
      } else if (techLower.contains('tailwind') ||
          techLower.contains('styled')) {
        return 'Styling';
      } else if (techLower.contains('webpack') || techLower.contains('vite')) {
        return 'Build Tool';
      } else if (techLower.contains('jest') || techLower.contains('cypress')) {
        return 'Testing';
      } else if (techLower.contains('git')) {
        return 'Version Control';
      } else if (techLower.contains('graphql') || techLower.contains('rest')) {
        return 'API';
      } else if (techLower.contains('node') || techLower.contains('express')) {
        return 'Backend';
      }
      return 'Frontend Technology';
    } else {
      // Backend categories
      if (techLower.contains('javascript') ||
          techLower.contains('python') ||
          techLower.contains('java') ||
          techLower.contains('c#') ||
          techLower.contains('go') ||
          techLower.contains('rust') ||
          techLower.contains('php') ||
          techLower.contains('ruby')) {
        return 'Language';
      } else if (techLower.contains('express') ||
          techLower.contains('django') ||
          techLower.contains('spring') ||
          techLower.contains('asp.net') ||
          techLower.contains('laravel') ||
          techLower.contains('flask') ||
          techLower.contains('nestjs') ||
          techLower.contains('rails')) {
        return 'Framework';
      } else if (techLower.contains('sql') ||
          techLower.contains('mongo') ||
          techLower.contains('redis') ||
          techLower.contains('cassandra') ||
          techLower.contains('dynamo') ||
          techLower.contains('elastic')) {
        return 'Database';
      } else if (techLower.contains('docker') ||
          techLower.contains('kubernetes') ||
          techLower.contains('aws') ||
          techLower.contains('azure') ||
          techLower.contains('cloud') ||
          techLower.contains('ci/cd') ||
          techLower.contains('terraform') ||
          techLower.contains('serverless')) {
        return 'Cloud & DevOps';
      } else if (techLower.contains('rest') ||
          techLower.contains('graphql') ||
          techLower.contains('grpc') ||
          techLower.contains('websocket') ||
          techLower.contains('jwt') ||
          techLower.contains('oauth') ||
          techLower.contains('swagger') ||
          techLower.contains('openapi') ||
          techLower.contains('webhook')) {
        return 'API';
      }
      return 'Backend Technology';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.context == AssistantContext.frontend
            ? 'Frontend AI Assistant'
            : 'Backend AI Assistant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showTipsDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  // Show context-specific tips dialog
  void _showTipsDialog(BuildContext context) {
    String contextName =
        widget.context == AssistantContext.frontend ? 'Frontend' : 'Backend';

    String example1 = widget.context == AssistantContext.frontend
        ? 'What is React?'
        : 'What is Node.js?';

    String example2 = widget.context == AssistantContext.frontend
        ? 'Explain TypeScript'
        : 'Explain PostgreSQL';

    String example3 = widget.context == AssistantContext.frontend
        ? 'Tell me about Tailwind CSS'
        : 'Tell me about Docker';

    String example4 = widget.context == AssistantContext.frontend
        ? 'How to use Redux?'
        : 'How to use MongoDB?';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tips for using $contextName AI Assistant'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    'Simply type any query to navigate to a detail page:'),
                const SizedBox(height: 8),
                Text('• $example1'),
                Text('• $example2'),
                Text('• $example3'),
                Text('• $example4'),
                const SizedBox(height: 16),
                Text(
                  'Any question will navigate you to a detail page with information about that $contextName technology!',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextComposer() {
    String placeholder = widget.context == AssistantContext.frontend
        ? 'Ask about any frontend technology...'
        : 'Ask about any backend technology...';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _isLoading ? null : handleSubmitted,
              decoration: InputDecoration(
                hintText: placeholder,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.blue,
            onPressed:
                _isLoading ? null : () => handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}

// ChatMessage UI - no changes needed
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({Key? key, required this.text, required this.isUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) const CircleAvatar(child: Text('A')), // Assistant Avatar
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(isUser ? 'You' : 'Assistant',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.blue[100] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(text),
                ),
              ],
            ),
          ),
          if (isUser) const CircleAvatar(child: Text('Y')), // User Avatar
        ],
      ),
    );
  }
}
