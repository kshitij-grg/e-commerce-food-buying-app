import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants.dart';
import 'package:readmore/readmore.dart';
import 'single_food_controller.dart';
import 'package:get/get.dart';
import '../../widgets/loading.dart';

class SingleFoodScreen extends StatelessWidget {
  const SingleFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this controller is to use the value sent from previous screen using Get.to()
    final putController = Get.put(SingleFoodController());

// this controller is to use the value created in the controller class
    final getController = Get.find<SingleFoodController>();
    return Scaffold(
      backgroundColor: lightGray,
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedNetworkImage(
                  imageUrl: putController.food.image,
                  height: 400,
                  placeholder: (context, url) => Loading(
                    size: 200,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.cancel_sharp,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 * 0.95,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(1, 3),
                      blurRadius: 1,
                      spreadRadius: 3)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      putController.food.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      putController.food.unit,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ReadMoreText(
                    putController.food.description,
                    trimLines: 2,
                    colorClickableText: primaryColor,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    style: TextStyle(color: Colors.black),
                    moreStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: lightGray,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: getController.decrement,
                                child: SvgPicture.asset(
                                  'assets/icons/subtract.svg',
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${getController.count.value}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: getController.increment,
                                child: const Icon(
                                  Icons.add,
                                  size: 22,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (getController.count >= 10) {
                          Fluttertoast.showToast(
                              msg:
                                  "Only upto 10 pieces can be ordered at a time",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: primaryColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          getController.addToCart();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        width: MediaQuery.of(context).size.width / 2 * 0.95,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add to cart',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              "Rs. ${putController.food.price}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
