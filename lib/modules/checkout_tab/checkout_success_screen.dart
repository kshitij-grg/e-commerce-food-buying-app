import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/success.dart';
import 'package:get/get.dart';
import '../../modules/order/order_screen.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(child: SuccessScreen()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: CustomButton(
                  label: "Check your Order",
                  onPress: () {
                    Get.off(() => OrderScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
