import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/utils/grokcloud.dart';

class Chatgpt extends StatefulWidget {
  const Chatgpt({Key? key}) : super(key: key);

  @override
  _ChatgptState createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String selectedModel = "gpt-3.5-turbo";

  @override
  void initState() {
    super.initState();
    fetchModels();
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
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });

    _textController.clear();

    final response = await sendPostPrompt(text, selectedModel);
    if (response != null && response.choices.isNotEmpty) {
      final cleanedResponse = response.choices.first.message.content
          .replaceAll(RegExp(r'<\/?think>'), '');
      setState(() {
        _messages.insert(0, ChatMessage(text: cleanedResponse, isUser: false));
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grok Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          if (_isLoading) const CircularProgressIndicator(),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
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
              decoration:
                  const InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
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
          if (!isUser) const CircleAvatar(child: Text('G')), // Bot Avatar
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(isUser ? 'You' : 'Grok',
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
