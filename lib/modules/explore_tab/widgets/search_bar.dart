import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

import 'custom_food_search_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: CustomFoodSearchDelegate());
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightGray,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Search for foods',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
