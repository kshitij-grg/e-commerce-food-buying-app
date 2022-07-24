import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/models/order/order_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/auth/login_response.dart';

class CheckoutApi {
  static Future<LoginResponse> checkout(
      {required String apiKey,
      required String orderDate,
      required String orderTime,
      required String paymentType,
      required String orderStatus,
      required int addressId}) async {
    final url = baseUrl + "checkout";
    Uri uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "order_date": orderDate,
      "order_time": orderTime,
      "payment_type": paymentType,
      "order_status": orderStatus,
      "address_id": addressId.toString(),
    };

    final response = await http.post(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception("Failed to checkout");
    }
  }

  static Future<List<OrderHistory>> getOrderHistory() async {
    String apiKey = Get.find<AppController>().getToken();
    final url = baseUrl + "checkout";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri, headers: {"api_key": apiKey});

    if (response.statusCode == 200) {
      return OrderDetailsResponse.fromJson(json.decode(response.body))
          .orderHistory;
    } else if (response.statusCode == 400) {
      return OrderDetailsResponse.fromJson(json.decode(response.body))
          .orderHistory;
    } else {
      throw Exception("Failed to load Order History");
    }
  }
}
