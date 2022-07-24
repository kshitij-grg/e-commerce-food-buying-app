import 'package:food_delivery/data/api/checkout_api.dart';
import 'package:food_delivery/data/models/order/order_details.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  List<OrderHistory> orderHistory = [];
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getOrderDetails();
  }

  Future<void> getOrderDetails() async {
    isLoading(true);
    try {
      orderHistory = await CheckoutApi.getOrderHistory();
      isLoading(false);
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
