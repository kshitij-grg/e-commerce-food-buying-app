import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/explore_tab/category_controller.dart';
import 'package:food_delivery/modules/explore_tab/food_controller.dart';
import 'package:food_delivery/widgets/loading.dart';
import 'package:get/get.dart';

import 'widgets/category_bar.dart';
import 'widgets/search_bar.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());
  final foodController = Get.put(FoodController());

  Future<void> getAll() async {
    categoryController.getCategories();
    foodController.getFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Pokhara, Nepal",
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => getAll(),
        child: Obx(
          () => categoryController.isLoading.isTrue &&
                  foodController.isLoading.isTrue
              ? Loading(
                  size: 200,
                )
              : categoryController.isError.isTrue &&
                      foodController.isError.isTrue
                  ? Loading(
                      size: 200,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Fast and',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Delicious ',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Food \u270C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: CategoryBar(
                            categories: categoryController.categories,
                            foods: foodController.foods,
                          )),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
