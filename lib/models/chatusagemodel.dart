class ChatUsage {
  int? promptTokens;
  double? promptTime;
  int? completionTokens;
  double? completionTime;
  int? totalTokens;
  double? totalTime;

  ChatUsage({
    this.promptTokens,
    this.promptTime,
    this.completionTokens,
    this.completionTime,
    this.totalTokens,
    this.totalTime,
  });

  factory ChatUsage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ChatUsage();

    return ChatUsage(
      promptTokens: json['prompt_tokens'] as int?,
      promptTime: json['prompt_time'] as double?,
      completionTokens: json['completion_tokens'] as int?,
      completionTime: json['completion_time'] as double?,
      totalTokens: json['total_tokens'] as int?,
      totalTime: json['total_time'] as double?,
    );
  }
}
