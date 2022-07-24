import 'package:flutter/cupertino.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/api/auth_api.dart';
import 'package:food_delivery/modules/auth/login/login_screen.dart';
import 'package:get/get.dart';
import '../../../app_controller.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phnController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final controller = Get.find<AppController>();

  RegExp upperCaseRegex = RegExp(r'[A-Z]');
  RegExp lowerCaseRegex = RegExp(r'[a-z]');
  RegExp eightCharRegex = RegExp(r'^.{8,}$');
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//       r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   .{8,}             // Must be at least 8 characters in length
// $

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phnNum = phnController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || phnNum.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }
    if (!emailRegex.hasMatch(email)) {
      Get.rawSnackbar(
          message: "Invalid email pattern", backgroundColor: primaryColor);
      return;
    }
    if (!eightCharRegex.hasMatch(password)) {
      Get.rawSnackbar(
          message: "Password must have atleast 8 characters",
          backgroundColor: primaryColor);
      return;
    } else if (!upperCaseRegex.hasMatch(password)) {
      Get.rawSnackbar(
          message: "Password must contain atleast one Captial letter",
          backgroundColor: primaryColor);
      return;
    } else if (!lowerCaseRegex.hasMatch(password)) {
      Get.rawSnackbar(
          message: "Password must contain atleast one Small letter",
          backgroundColor: primaryColor);
      return;
    }
    if (confirmPassword != password) {
      Get.rawSnackbar(message: "Passwords didnot match");
      return;
    }

    isLoading(true);

    try {
      var response = await AuthApi.register(
          name: name, email: email, phnNum: phnNum, password: password);
      isLoading(false);
      if (response.error != null && response.error == false) {
        controller.isLoggedIn(true);
        Get.rawSnackbar(
            backgroundColor: primaryColor, message: 'Register successful');
        Get.offAll(() => const LoginScreen());
      } else {
        Get.rawSnackbar(
            backgroundColor: primaryColor, message: response.message);
      }
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phnController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
