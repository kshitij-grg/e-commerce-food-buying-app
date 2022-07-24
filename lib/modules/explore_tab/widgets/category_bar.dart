import 'package:flutter/material.dart';
import '../../../data/models/food/category.dart';
import 'category_tile.dart';
import 'food_container.dart';
import '../../../data/models/food/food.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({required this.categories, required this.foods, Key? key})
      : super(key: key);

  // final List<Food> foods;
  final List<Categories> categories;
  final List<Foods> foods;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedCategoryIndex = 1;

  Widget getFoods() {
    List<Foods> categoryItem = [];

    // for (Categories category in widget.categories) {
    //   if (category.name == "All") {
    //     selectedCategoryIndex = category.id;
    //   }
    // }

    if (selectedCategoryIndex == 1) {
      categoryItem = widget.foods;
    } else {
      for (Foods food in widget.foods) {
        if (selectedCategoryIndex == food.categoryId) {
          categoryItem.add(food);
        }
      }
    }

    return GridView.builder(
      itemCount: categoryItem.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (context, index) => FoodContainer(
        food: categoryItem[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = widget.categories[index].id;
                });
              },
              child: Container(
                margin: index == widget.categories.length - 1
                    ? const EdgeInsets.only(right: 0)
                    : const EdgeInsets.only(right: 20),
                child: CategoryTile(
                  category: widget.categories[index],
                  isSelected:
                      selectedCategoryIndex == widget.categories[index].id,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: getFoods(),
        )
      ],
    );
  }
}
