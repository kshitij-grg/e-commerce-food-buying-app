import 'package:food_delivery/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/auth/login_response.dart';

class FeedbackApi {
  static Future<LoginResponse> submit(
      {required String apiKey,
      required String subject,
      required String message}) async {
    final url = baseUrl + "feedback";
    Uri uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "subject": subject,
      "message": message,
    };

    final response = await http.post(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception("Failed to provide Feedback");
    }
  }
}
