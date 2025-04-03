class GroqAiModelList {
  List<GroqModel> models;

  GroqAiModelList({required this.models});

  factory GroqAiModelList.fromJson(Map<String, dynamic> json) {
    return GroqAiModelList(
      models: (json['data'] as List<dynamic>?)
              ?.map((model) => GroqModel.fromJson(model))
              .toList() ??
          [],
    );
  }
}

class GroqModel {
  final String id;

  GroqModel({required this.id});

  factory GroqModel.fromJson(Map<String, dynamic> json) {
    return GroqModel(
      id: json['id'] as String? ?? '',
    );
  }
}
