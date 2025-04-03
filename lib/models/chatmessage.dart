class ChatMessage {
  String? role;
  String? content;

  ChatMessage({
    this.role,
    this.content,
  });

  factory ChatMessage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ChatMessage();

    return ChatMessage(
      role: json['role'] as String?,
      content: json['content'] as String?,
    );
  }
}
