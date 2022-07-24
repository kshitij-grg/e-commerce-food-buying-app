import 'package:food_delivery/data/models/order/order_details.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderHistory? orderHistory;

  @override
  void onInit() {
    super.onInit();
    orderHistory = Get.arguments;
  }
}
