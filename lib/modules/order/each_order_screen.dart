import 'package:flutter/material.dart';
import 'package:food_delivery/modules/order/order_controller.dart';
import 'package:food_delivery/modules/order/order_food.dart';
import 'package:get/get.dart';
import '../../modules/explore_tab/widgets/food_container.dart';

class EachOrderScreen extends StatelessWidget {
  const EachOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    final controller = Get.find<OrderController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Ordered Items'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: controller.orderHistory!.orderDetails.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => OrderFood(
                            food: controller
                                .orderHistory!.orderDetails[index].food,
                            orderDetails:
                                controller.orderHistory!.orderDetails[index],
                          )),
                ),
              ],
            ),
          ),
        ));
  }
}
