import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/auth/login/forget_password_controller.dart';
import 'package:food_delivery/modules/auth/register/register_screen.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/password_field.dart';
import 'package:food_delivery/widgets/progress_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/input_text_field.dart';
import 'package:get/get.dart';
import 'forget_password_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    Get.put(ForgetPasswordController());
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
                  'Let\'s Sign You In',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Welcome Back, You\'ve\nbeen missed!'),
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
                PasswordField("Your Password",
                    controller: controller.passwordController),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => controller.isLoading.isTrue
                    ? const ProgressLoading(
                        size: 100,
                      )
                    : CustomButton(label: "Login", onPress: controller.login)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont't have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(const RegisterScreen());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
