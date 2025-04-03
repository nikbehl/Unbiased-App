import 'package:frontend_dev_guide/models/chatchoicemodel.dart';
import 'package:frontend_dev_guide/models/chatusagemodel.dart';

class ChatCompletion {
  String? id;
  String? object;
  int? created;
  String? model;
  List<ChatChoice>? choices;
  ChatUsage? usage;
  String? systemFingerprint;
  Map<String, dynamic>? xGroq;

  ChatCompletion({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
    this.systemFingerprint,
    this.xGroq,
  });

  factory ChatCompletion.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ChatCompletion();

    return ChatCompletion(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      choices: (json['choices'] as List?)
          ?.map((choice) => ChatChoice.fromJson(choice))
          .toList(),
      usage: ChatUsage.fromJson(json['usage']),
      systemFingerprint: json['system_fingerprint'] as String?,
      xGroq: json['x_groq'] as Map<String, dynamic>?,
    );
  }
}
