import 'package:flutter/material.dart';
import 'package:food_delivery/modules/profile_tab/profile_controller.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../widgets/input_text_field.dart';
import '../../widgets/custom_button.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  textEditingController: controller.nameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  textEditingController: controller.phnController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: "Update Profile",
                onPress: controller.manageProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
