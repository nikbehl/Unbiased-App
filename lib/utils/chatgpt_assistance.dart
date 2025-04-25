import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/utils/grokcloud.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';
import 'package:frontend_dev_guide/utils/ai_content_parser.dart';

class Chatgpt extends StatefulWidget {
  const Chatgpt({Key? key}) : super(key: key);

  @override
  _ChatgptState createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  String selectedModel = "gpt-3.5-turbo";

  // List of technologies to recognize in chat - expanded to catch more matches
  final List<String> _techItems = [
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

  @override
  void initState() {
    super.initState();
    fetchModels();

    // Add welcome message
    _messages.add(
      const ChatMessage(
        text:
            "Welcome to the AI Assistant! Ask me about any frontend technology like 'What is React?' or 'Explain TypeScript'.",
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

    // Always treat queries as technology questions for navigation
    // Either find a specific tech or use the entire query
    String? techMatch = _findTechInQuery(text);
    String techToUse = techMatch ?? _extractMainTopic(text);

    debugPrint("Using technology: $techToUse for navigation");

    // Format prompt for better structure regardless of match
    String prompt =
        "Please provide detailed information about $techToUse in frontend development. "
        "Format your answer with these sections:\n"
        "Description: [Explain what $techToUse is and its importance]\n"
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
                  category: _getCategoryForTech(techToUse),
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
  String? _findTechInQuery(String query) {
    query = query.toLowerCase();

    // Look for technology matches - case insensitive
    for (var tech in _techItems) {
      if (query.contains(tech.toLowerCase())) {
        debugPrint("Found tech match: $tech");
        return tech;
      }
    }

    return null;
  }

  // Get the category for a technology
  String _getCategoryForTech(String tech) {
    final techLower = tech.toLowerCase();

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
    } else if (techLower.contains('tailwind') || techLower.contains('styled')) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
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

  // Show tips dialog
  void _showTipsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tips for using AI Assistant'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    'Simply type any query to navigate to a detail page:'),
                const SizedBox(height: 8),
                const Text('• What is React?'),
                const Text('• Explain TypeScript'),
                const Text('• Tell me about Tailwind CSS'),
                const Text('• How to use Redux?'),
                const SizedBox(height: 16),
                const Text(
                  'Any question will navigate you to a detail page with information about that technology!',
                  style: TextStyle(fontStyle: FontStyle.italic),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _isLoading ? null : handleSubmitted,
              decoration: const InputDecoration(
                hintText: 'Ask about any technology...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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

// ChatMessage UI
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
