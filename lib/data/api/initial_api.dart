import 'dart:convert';
import 'package:food_delivery/data/models/auth/login_response.dart';
import 'package:food_delivery/data/models/user/user_response.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class InitialApi {
  static Future<List<Users>> getUsers() async {
    final url = baseUrl + "users";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body)).users;
    } else {
      throw Exception("Failed to load Users");
    }
  }

  static Future<LoginResponse> forgetPassword(
      {required String password, required String email}) async {
    final url = baseUrl + "forget-password";
    final uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "email": email,
      "password": password,
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failed to change Password');
    }
  }
}
