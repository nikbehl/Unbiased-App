import 'package:frontend_dev_guide/models/chatmessage.dart';

class ChatChoice {
  int? index;
  ChatMessage? message;
  dynamic? logprobs; // Adjust type if known
  String? finishReason;

  ChatChoice({
    this.index,
    this.message,
    this.logprobs,
    this.finishReason,
  });

  factory ChatChoice.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ChatChoice();

    return ChatChoice(
      index: json['index'] as int?,
      message: ChatMessage.fromJson(json['message']),
      logprobs: json['logprobs'], // Adjust type if known
      finishReason: json['finish_reason'] as String?,
    );
  }
}
