import 'package:get/get.dart';
import '../../data/models/food/food.dart';
import '../../modules/cart_tab/cart_controller.dart';

class SingleFoodController extends GetxController {
  final count = 1.obs;
  late final Foods food;

  @override
  void onInit() {
    super.onInit();
    food = Get.arguments;
  }

// to decreaset the quantity value in each food screen
  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

// to decreaset the quantity value in each food screen
  void increment() {
    count.value++;
  }

  Future<void> addToCart() async {
    Get.find<CartController>().addToCart(food.id, quantity: count.value);
  }
}
