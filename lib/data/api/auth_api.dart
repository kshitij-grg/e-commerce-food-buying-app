import 'dart:convert';
import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/data/models/auth/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class AuthApi {
  static Future<LoginResponse> register(
      {required String name,
      required String email,
      required String phnNum,
      required String password}) async {
    final url = baseUrl + "register";

    Map<String, String> requestBody = <String, String>{
      'name': name,
      'email': email,
      'phnNum': phnNum,
      'password': password
    };

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(requestBody)
      ..headers.addAll({'Content-Type': 'multipart/form-data'});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = json.decode(respStr);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<LoginResponse> login(
      {required String email, required String password}) async {
    final url = baseUrl + "login";

    Map<String, String> requestBody = <String, String>{
      'email': email,
      'password': password
    };

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(requestBody)
      ..headers.addAll({'Content-Type': 'multipart/form-data'});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = json.decode(respStr);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("name", loginResponse.name ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("email", loginResponse.email ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("phnNum", loginResponse.phnNum ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("password", loginResponse.password ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<LoginResponse> manageProfile(
      {required String name,
      required String email,
      required String phnNum,
      required String apiKey}) async {
    final url = baseUrl + "manage-profile";
    final uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "name": name,
      "email": email,
      "phnNum": phnNum
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failes to update Profile');
    }
  }

  static Future<LoginResponse> changePassword(
      {required String password, required String apiKey}) async {
    final url = baseUrl + "change-password";
    final uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "password": password,
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
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
