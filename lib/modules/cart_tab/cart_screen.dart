import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/cart_tab/cart_controller.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../checkout_tab/checkout_screen.dart';
import 'widgets/cart_food_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: GetBuilder<CartController>(builder: (cartController) {
        return cartController.cartFoods.isEmpty
            ? Center(child: Text('Your Cart is Empty'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartFoods.length,
                      itemBuilder: (context, index) =>
                          CartFoodTile(cartController.cartFoods[index]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightGray),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total cost:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${cartController.total.value}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            label: 'Checkout',
                            onPress: () {
                              Get.to(() => CheckoutScreen());
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
      }),
    );
  }
}
