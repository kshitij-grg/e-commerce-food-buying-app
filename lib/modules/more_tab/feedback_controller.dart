import 'package:flutter/material.dart';
import 'package:food_delivery/data/api/feedback_api.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../constants.dart';

class FeedbackController extends GetxController {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  String apiKey = Get.find<AppController>().getToken();
  final isLoading = false.obs;

  Future<void> provideFeedback() async {
    String subject = subjectController.text.trim();
    String message = messageController.text.trim();
    isLoading(true);
    try {
      var response = await FeedbackApi.submit(
          apiKey: apiKey, subject: subject, message: message);
      isLoading(false);

      if (response.error == false) {
        subjectController.clear();
        messageController.clear();
        Get.rawSnackbar(
            backgroundColor: primaryColor, message: 'Feedback provided!');
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
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
