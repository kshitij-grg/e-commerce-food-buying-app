import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_text_field.dart';
import 'address_controller.dart';
import '../../widgets/progress_loading.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.find<AddressController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            InputTextField(
                label: "Street Name",
                textEditingController: checkoutController.streetController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text),
            SizedBox(
              height: 30,
            ),
            InputTextField(
                label: "House No.",
                textEditingController: checkoutController.houseNoController,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => checkoutController.isLoading.isTrue
                  ? ProgressLoading(
                      size: 100,
                    )
                  : CustomButton(
                      label: "Add Address",
                      onPress: checkoutController.addAddress,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
