import 'package:flutter/material.dart';
import 'package:food_delivery/modules/auth/login/forget_password_controller.dart';
import 'package:food_delivery/modules/profile_tab/password_controller.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/input_text_field.dart';
import 'package:food_delivery/widgets/password_field.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
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
                  label: "Your Email",
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 30,
              ),
              PasswordField("New Password",
                  controller: controller.newPasswordController),
              const SizedBox(
                height: 30,
              ),
              PasswordField("Confirm New Password",
                  controller: controller.confirmNewPasswordController),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: "Change Password",
                onPress: controller.forgetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
