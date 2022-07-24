import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/data/api/checkout_api.dart';
import 'package:food_delivery/modules/cart_tab/cart_controller.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'checkout_success_screen.dart';

class CheckoutController extends GetxController {
  String apiKey = Get.find<AppController>().getToken();
  final isLoading = false.obs;

  Future<void> checkout(
      {required String orderDate,
      required String orderTime,
      required String paymentType,
      required String orderStatus,
      required int addressId}) async {
    isLoading(true);
    try {
      var response = await CheckoutApi.checkout(
          apiKey: apiKey,
          orderDate: orderDate,
          orderTime: orderTime,
          paymentType: paymentType,
          orderStatus: orderStatus,
          addressId: addressId);
      isLoading(false);

      if (response.error == false) {
        Get.off(() => CheckoutSuccessScreen());
        Get.find<CartController>().clearCart();
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
}
