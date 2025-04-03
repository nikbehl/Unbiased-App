class GroqResponseModel {
  final List<Choice> choices;

  GroqResponseModel({required this.choices});

  factory GroqResponseModel.fromJson(Map<String, dynamic> json) {
    return GroqResponseModel(
      choices: (json['choices'] as List<dynamic>)
          .map((choice) => Choice.fromJson(choice))
          .toList(),
    );
  }
}

class Choice {
  final Message message;

  Choice({required this.message});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      message: Message.fromJson(json['message']),
    );
  }
}

class Message {
  final String content;

  Message({required this.content});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'] as String? ?? '',
    );
  }
}
