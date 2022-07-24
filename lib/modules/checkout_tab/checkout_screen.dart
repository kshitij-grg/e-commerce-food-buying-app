import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/models/address/address_fetch_response.dart';
import 'package:food_delivery/modules/cart_tab/cart_controller.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import '../address/address_controller.dart';
import '../address/delivery_address_screen.dart';
import 'package:intl/intl.dart';

import 'checkout_controller.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _paymentType = "";
  String orderDate = DateFormat('M-d-y').format(DateTime.now());
  String orderTime = DateFormat('hh:mm a').format(DateTime.now());
  String orderStatus = "";

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    final checkoutController = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Get.find<AppController>().getName(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Total: Rs. ${Get.find<CartController>().total.value}",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(
                            () => addressController.addressId.value == 0
                                ? ListTile(
                                    minVerticalPadding: 10,
                                    horizontalTitleGap: 0,
                                    onTap: () {
                                      Get.to(() => DeliveryAddressScreen());
                                    },
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Address',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'Select your Delivery Address',
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                  )
                                : ListTile(
                                    minVerticalPadding: 10,
                                    horizontalTitleGap: 0,
                                    onTap: () {
                                      Get.to(() => DeliveryAddressScreen());
                                    },
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                    title: Text(
                                      "House No. ${addressController.houseNo.value} , ${addressController.streetName.value}",
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                  ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat('hh:mm a').format(DateTime.now())),
                            Text(DateFormat('M-d-y').format(DateTime.now())),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: RadioListTile(
                            activeColor: primaryColor,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            title: Text("Cash on Delivery"),
                            secondary: Image.asset(
                              "assets/images/cod.png",
                              width: 40,
                              height: 40,
                            ),
                            value: "cod",
                            groupValue: _paymentType,
                            onChanged: (value) => setState(() {
                                  _paymentType = value.toString();
                                  orderStatus = "Pending";
                                })),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: RadioListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            activeColor: primaryColor,
                            title: Text("Pay By khalti"),
                            secondary: Image.asset(
                              "assets/images/khalti.png",
                              width: 40,
                              height: 40,
                            ),
                            value: "khalti",
                            groupValue: _paymentType,
                            onChanged: (value) => setState(() {
                                  _paymentType = value.toString();
                                  orderStatus = "Paid";
                                })),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: CustomButton(
                  label: "Order Now",
                  onPress: () {
                    if (addressController.addressId.value == 0) {
                      Fluttertoast.showToast(
                          msg: "Please Select your Address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else if (_paymentType == "") {
                      Fluttertoast.showToast(
                          msg: "Please Select Payment Type",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else {
                      if (_paymentType == "cod") {
                        checkoutController.checkout(
                            orderDate: orderDate,
                            orderTime: orderTime,
                            paymentType: _paymentType,
                            orderStatus: orderStatus,
                            addressId: addressController.addressId.value);
                      } else {
                        KhaltiScope.of(context).pay(
                          config: PaymentConfig(
                            amount: Get.find<CartController>()
                                .total
                                .value
                                .toInt(), // Amount will be in paisa so our actual amount will not be shown in khalti UI because khalti lets us only pay upto 200
                            productIdentity: 'CTE01',
                            productName: 'Click to Eat',
                          ),
                          onSuccess: (s) {
                            checkoutController.checkout(
                                orderDate: orderDate,
                                orderTime: orderTime,
                                paymentType: _paymentType,
                                orderStatus: orderStatus,
                                addressId: addressController.addressId.value);
                          },
                          onFailure: (s) {
                            print(s);
                          },
                          onCancel: () {
                            Fluttertoast.showToast(
                                msg: "Order Cancelled",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: primaryColor,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          },
                        );
                      }
                    }
                  }),
            ),
          ],
        ));
  }
}
