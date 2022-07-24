import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/models/order/cart_food.dart';
import 'package:food_delivery/widgets/loading.dart';
import 'package:get/get.dart';

import '../cart_controller.dart';

// this class is for each layout of cart item in the cart screen.
class CartFoodTile extends StatelessWidget {
  const CartFoodTile(this.cartFood, {Key? key}) : super(key: key);
  final Foods cartFood;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: lightGray),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(1, 1),
            )
          ]),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartFood.image,
            width: 60,
            height: 60,
            placeholder: (context, url) => Loading(
              size: 50,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartFood.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (int.parse(cartFood.cartQuantity) > 1) {
                          Get.find<CartController>().changeQuantity(
                              cartFood.id,
                              cartFood.cartId,
                              int.parse(cartFood.cartQuantity) - 1);
                        }
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: SvgPicture.asset(
                          'assets/icons/subtract.svg',
                          width: 16,
                          height: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          cartFood.cartQuantity,
                          style: TextStyle(color: primaryColor),
                        )),
                    InkWell(
                      onTap: () {
                        Get.find<CartController>().changeQuantity(
                            cartFood.id,
                            cartFood.cartId,
                            int.parse(cartFood.cartQuantity) + 1);
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Rs. ${cartFood.price * int.parse(cartFood.cartQuantity)}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text('Remove Food from Cart?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                    style: TextStyle(color: Colors.red)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.find<CartController>().removeFromCart(
                                        cartFood.id, cartFood.cartId);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Remove')),
                            ],
                          ));
                },
                child: Icon(
                  Icons.delete_outline,
                  size: 24,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
