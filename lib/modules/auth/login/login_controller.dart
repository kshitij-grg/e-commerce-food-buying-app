import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app_controller.dart';
import '../../../constants.dart';
import '../../../data/api/auth_api.dart';
import '../../home_tab/home_screen.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.find<AppController>();

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    isLoading(true);

    try {
      var response = await AuthApi.login(email: email, password: password);
      isLoading(false);
      if (response.error != null && response.error == false) {
        controller.isLoggedIn(true);
        Get.rawSnackbar(
            backgroundColor: primaryColor, message: 'Login successful');
        Get.offAll(() => const HomeScreen());
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
