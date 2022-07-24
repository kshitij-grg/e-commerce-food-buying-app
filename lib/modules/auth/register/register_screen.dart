import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/auth/login/login_screen.dart';
import 'package:food_delivery/modules/auth/register/register_controller.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/password_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/input_text_field.dart';
import 'package:get/get.dart';
import '../../../widgets/progress_loading.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Getting Started',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 22)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Create an account to \ncontinue!'),
              const SizedBox(
                height: 40,
              ),
              InputTextField(
                  label: "Your Email",
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  label: "Your Name",
                  textEditingController: controller.nameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  label: "Your Phone Numebr",
                  textEditingController: controller.phnController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone),
              const SizedBox(
                height: 30,
              ),
              PasswordField("Your Password",
                  controller: controller.passwordController),
              const SizedBox(
                height: 30,
              ),
              PasswordField("Confirm Password",
                  controller: controller.confirmPasswordController),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? const ProgressLoading(
                        size: 100,
                      )
                    : CustomButton(
                        label: "Create Account",
                        onPress: controller.register,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(const LoginScreen());
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
