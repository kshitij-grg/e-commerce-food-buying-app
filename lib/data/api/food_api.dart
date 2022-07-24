import 'dart:convert';
import '../models/food/food.dart';
import 'package:food_delivery/constants.dart';
import '../models/food/category.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  static Future<List<Categories>> getCategories() async {
    final url = baseUrl + "get-categories";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Category.fromJson(json.decode(response.body)).categories;
    } else {
      throw Exception('Failed to Load Categories');
    }
  }

  static Future<List<Foods>> getFoods() async {
    final url = baseUrl + "get-all-foods";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Food.fromJson(json.decode(response.body)).foods;
    } else {
      throw Exception('Failed to Load Foods');
    }
  }
}
