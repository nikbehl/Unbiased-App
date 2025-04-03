import 'package:dio/dio.dart';
import 'package:frontend_dev_guide/models/grokmodelailist.dart';
import 'package:frontend_dev_guide/models/grokresponsemodel.dart';

Future<GroqAiModelList?> getAvailableModels() async {
  String apikey = "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";
  const String url = "https://api.groq.com/openai/v1/models";
  Dio dio = Dio();
  try {
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apikey",
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Response data: ${response.data}');
      return GroqAiModelList.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

Future<GroqResponseModel?> sendPostPrompt(
    String userPrompt, String model) async {
  String apikey = "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";
  const String url = "https://api.groq.com/openai/v1/chat/completions";
  Dio dio = Dio();

  try {
    final response = await dio.post(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apikey",
          "Content-Type": "application/json",
        },
      ),
      data: {
        "messages": [
          {"role": "user", "content": userPrompt}
        ],
        "model": model,
      },
    );

    if (response.statusCode == 200) {
      print('Response data: ${response.data}');
      return GroqResponseModel.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
