import 'package:flutter/material.dart';
import 'package:food_delivery/modules/single_food_tab/single_food_screen.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/loading.dart';
import '../../data/models/order/order_details.dart';

class OrderFood extends StatelessWidget {
  const OrderFood({
    required this.food,
    required this.orderDetails,
    Key? key,
  }) : super(key: key);

  final Food food;
  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: lightGray.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: food.image,
              fit: BoxFit.cover,
              placeholder: (context, url) => Loading(
                size: 50,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            food.name,
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quantity: ${orderDetails.totalQuantity}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Cost:",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 1),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: Text(
                  'Rs. ${orderDetails.totalCost}',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
