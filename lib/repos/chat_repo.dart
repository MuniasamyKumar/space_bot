import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:space_bot/models/chat_message_model.dart';
import 'package:space_bot/utils/api_key.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent?key=$apiKey",
          data: {
            "contents": previousMessages.map((e) => e.toMap()).toList(),
          });
      log(response.toString());

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['candidates'].first['content']['parts'].first['text'];
      }
      return '';  
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
