import 'dart:convert';

import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/data/models/auth/login_response.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../models/order/cart_food.dart';
import 'package:http/http.dart' as http;

class CartLocalFood {
  static String key = "cartLocal";

  static Future<List<Foods>> get(apiKey) async {
    final url = baseUrl + "cart";
    final response = await http.get(Uri.parse(url), headers: {
      "api_key": "$apiKey",
    });

    if (response.statusCode == 200) {
      return CartFood.fromJson(json.decode(response.body)).foods;
    } else {
      throw Exception('Failed to Load Cart Items');
    }
  }

  static Future<LoginResponse> set({
    required String apiKey,
    required int id,
    required String cartQuantity,
  }) async {
    final url = baseUrl + "cart";

    Map<String, String> requestBody = <String, String>{
      'food_id': id.toString(),
      'quantity': cartQuantity,
    };

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(requestBody)
      ..headers
          .addAll({"api_key": apiKey, 'Content-Type': 'multipart/form-data'});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = json.decode(respStr);
      // print(data);
      LoginResponse response = LoginResponse.fromJson(data);
      // CartFood cartFood = CartFood.fromJson(data);
      return response;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception(respStr);
    }
  }

  static Future<LoginResponse> remove({
    required String apiKey,
    required int cartId,
  }) async {
    final url = baseUrl + "cart";

    Map<String, String> qParams = <String, String>{
      'cart_id': cartId.toString(),
    };

    Uri uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: qParams); //USE THIS

    final response = await http.delete(finalUri, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failed to Delete Cart Items');
    }
  }

  static Future<LoginResponse> updateCart(
      {required String apiKey,
      required int cartId,
      required String quantity}) async {
    final url = baseUrl + "cart";
    Uri uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "cart_id": cartId.toString(),
      "cart_quantity": quantity,
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failes to update Cart Item');
    }
  }
}
