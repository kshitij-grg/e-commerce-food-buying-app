import 'package:flutter/material.dart';
import 'package:food_delivery/modules/explore_tab/food_controller.dart';
import 'package:food_delivery/modules/explore_tab/widgets/food_container.dart';
import 'package:get/get.dart';
import '../../../data/models/food/food.dart';

class CustomFoodSearchDelegate extends SearchDelegate {
  List<Foods> foodsList = Get.find<FoodController>().foods;

  @override
  TextStyle? get searchFieldStyle =>
      TextStyle(fontSize: 14, color: Colors.grey);

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Search for foods";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Foods> matchedFoods = [];
    for (Foods food in foodsList) {
      if (food.name.toLowerCase().contains(query.toLowerCase())) {
        matchedFoods.add(food);
      }
    }
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: matchedFoods.isEmpty
          ? Center(
              child: Text('No Results found',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            )
          : GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: matchedFoods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return FoodContainer(
                  food: matchedFoods[index],
                );
              }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Foods> matchedFoods = [];
    for (Foods food in foodsList) {
      if (food.name.toLowerCase().contains(query.toLowerCase())) {
        matchedFoods.add(food);
      }
    }
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: matchedFoods.isEmpty
          ? Center(
              child: Text('No Results found',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            )
          : GridView.builder(
              padding: EdgeInsets.all(15),
              itemCount: matchedFoods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return FoodContainer(
                  food: matchedFoods[index],
                );
              }),
    );
  }
}
