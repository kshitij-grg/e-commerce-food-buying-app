import 'dart:convert';
import 'package:food_delivery/data/models/address/address_fetch_response.dart';
import '../../constants.dart';
import '../models/address/address_response.dart';
import 'package:http/http.dart' as http;

class AddressApi {
  static Future<AddressResponse> address({
    required String apiKey,
    required String street,
    required String houseNo,
  }) async {
    final url = baseUrl + "address";

    Map<String, String> requestBody = <String, String>{
      'street': street,
      'house_no': houseNo,
    };

    Uri uri = Uri.parse(url);

    final response = await http.post(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AddressResponse.fromJson(data);
    } else {
      throw Exception('Error Occured while adding Address');
    }
  }

  static Future<List<Addresses>> getAddress({required String apiKey}) async {
    final url = baseUrl + "address";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri, headers: {"api_key": apiKey});

    if (response.statusCode == 200) {
      return AddressFetchResponse.fromJson(json.decode(response.body))
          .addresses;
    } else if (response.statusCode == 400) {
      return AddressFetchResponse.fromJson(json.decode(response.body))
          .addresses;
    } else {
      throw ("Failed to fetch Addresses");
    }
  }
}
