import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/order/order_details.dart';

import '../../../constants.dart';

class OrderStatusTile extends StatelessWidget {
  OrderStatusTile({required this.orderStat, required this.isSelected, Key? key})
      : super(key: key);
  String orderStat;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: isSelected ? primaryColor : Colors.white),
          color: isSelected ? Colors.white : primaryColor,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(
        orderStat,
        style: TextStyle(color: isSelected ? primaryColor : Colors.white),
      ),
    );
  }
}
