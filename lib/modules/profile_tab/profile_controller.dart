import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_controller.dart';
import '../../constants.dart';
import '../../data/api/auth_api.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phnController = TextEditingController();
  final controller = Get.find<AppController>();
  String apiKey = Get.find<AppController>().getToken();

  @override
  void onInit() {
    super.onInit();
    emailController.text = controller.getEmail();
    nameController.text = controller.getName();
    phnController.text = controller.getPhnNum();
  }

  Future<void> manageProfile() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phnNum = phnController.text.trim();

    if (name.isEmpty || email.isEmpty || phnNum.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    isLoading(true);

    try {
      var response = await AuthApi.manageProfile(
          name: name, email: email, phnNum: phnNum, apiKey: apiKey);
      isLoading(false);
      if (response.error != null && response.error == false) {
        controller.isLoggedIn(true);
        Get.back();
        Get.rawSnackbar(
            backgroundColor: primaryColor,
            message: 'Profile updated successfully');
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
    super.onClose();
  }
}
