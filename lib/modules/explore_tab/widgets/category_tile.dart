import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import '../../../data/models/food/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category, required this.isSelected, Key? key})
      : super(key: key);

  final Categories category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.8) : lightGray,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.network(
            category.icon,
            width: 18,
            height: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            category.name,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          )
        ],
      ),
    );
  }
}
