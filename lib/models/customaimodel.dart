class CustomAiModel {
  final String? id;
  final String? object;
  final int? created;
  final String? ownedBy;
  final bool? active;
  final int? contextWindow;

  CustomAiModel({
    this.id,
    this.object,
    this.created,
    this.ownedBy,
    this.active,
    this.contextWindow,
  });

  factory CustomAiModel.fromJson(Map<String, dynamic> json) {
    return CustomAiModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      ownedBy: json['owned_by'] as String?,
      active: json['active'] as bool?,
      contextWindow: json['context_window'] as int?,
    );
  }

  static List<CustomAiModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomAiModel.fromJson(json)).toList();
  }
}

class CustomAiModelList {
  final String? object;
  final List<CustomAiModel>? data;

  CustomAiModelList({
    this.object,
    this.data,
  });

  factory CustomAiModelList.fromJson(Map<String, dynamic> json) {
    return CustomAiModelList(
      object: json['object'] as String?,
      data: json['data'] != null
          ? CustomAiModel.fromJsonList(json['data'])
          : null,
    );
  }
}
