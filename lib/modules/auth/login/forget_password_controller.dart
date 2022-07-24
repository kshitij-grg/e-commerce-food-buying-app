import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/data/api/auth_api.dart';
import 'package:food_delivery/data/api/initial_api.dart';
import 'package:food_delivery/data/models/user/user_response.dart';
import 'package:get/get.dart';

import '../../../app_controller.dart';
import '../../../constants.dart';

class ForgetPasswordController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final controller = Get.find<AppController>();
  String apiKey = Get.find<AppController>().getToken();
  List<Users> usersList = [];
  String errorMessage = "";
  RegExp upperCaseRegex = RegExp(r'[A-Z]');
  RegExp lowerCaseRegex = RegExp(r'[a-z]');
  RegExp eightCharRegex = RegExp(r'^.{8,}$');

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      usersList = await InitialApi.getUsers();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load orders";
      }
      errorMessage = e.toString();
      print(errorMessage);
    }
  }

  Future<void> forgetPassword() async {
    String email = emailController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmNewPassword = confirmNewPasswordController.text.trim();
    String temp = "";

    if (email.isEmpty || newPassword.isEmpty || confirmNewPassword.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    for (int i = 0; i < usersList.length; i++) {
      if (email == usersList[i].email) {
        temp = usersList[i].email;
      }
    }

    if (email != temp) {
      Fluttertoast.showToast(
          msg: "Email Address doesnot exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (!eightCharRegex.hasMatch(newPassword)) {
      Get.rawSnackbar(
          message: "Password must have atleast 8 characters",
          backgroundColor: primaryColor);
      return;
    } else if (!upperCaseRegex.hasMatch(newPassword)) {
      Get.rawSnackbar(
          message: "Password must contain atleast one Captial letter",
          backgroundColor: primaryColor);
      return;
    } else if (!lowerCaseRegex.hasMatch(newPassword)) {
      Get.rawSnackbar(
          message: "Password must contain atleast one Small letter",
          backgroundColor: primaryColor);
      return;
    }

    if (confirmNewPassword != newPassword) {
      Fluttertoast.showToast(
          msg: "Passwords didnot match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    isLoading(true);

    try {
      var response =
          await InitialApi.forgetPassword(password: newPassword, email: email);

      isLoading(false);
      if (response.error != null && response.error == false) {
        emailController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
        Get.back();
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
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.onClose();
  }
}
