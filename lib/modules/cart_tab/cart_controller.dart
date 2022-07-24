import 'package:get/get.dart';
import '../../app_controller.dart';
import '../../constants.dart';
import '../../data/api/local/cart_local_food.dart';
import '../../data/models/order/cart_food.dart' as CartFood;

class CartController extends GetxController {
  List<CartFood.Foods> cartFoods = [];
  final total = 0.0.obs;
  final isLoading = false.obs;
  String apiKey = Get.find<AppController>().getToken();

  @override
  void onInit() {
    super.onInit();
    getCartFood();
  }

  Future<void> getCartFood() async {
    List<CartFood.Foods> tempCart = await CartLocalFood.get(apiKey);
    cartFoods.addAll(tempCart);
    calculateTotalCost();
    update();
  }

  void calculateTotalCost() {
    double newTotal = 0;
    for (var cartFood in cartFoods) {
      newTotal +=
          (double.parse(cartFood.cartQuantity) * cartFood.price.toDouble());
    }
    total(newTotal);
  }

  Future<void> updateCartFood() async {
    cartFoods = await CartLocalFood.get(apiKey);
    calculateTotalCost();
  }

  Future<void> addToCart(int foodId, {int quantity = 1}) async {
    isLoading(true);

    try {
      if (cartFoods.firstWhereOrNull((element) => element.id == foodId) ==
          null) {
        isLoading(false);

        var response = await CartLocalFood.set(
            apiKey: apiKey, id: foodId, cartQuantity: quantity.toString());

        if (response.error == false) {
          Get.rawSnackbar(
              backgroundColor: primaryColor,
              message: "Food Added to Cart Successfully");
        } else {
          Get.rawSnackbar(
              backgroundColor: primaryColor,
              message: "An Error Occured while Adding Food to Cart");
        }
      } else {
        Get.rawSnackbar(
            backgroundColor: primaryColor, message: 'Food Already on Cart');
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
    calculateTotalCost();
    updateCartFood();
    update();
  }

  Future<void> removeFromCart(int foodId, int cartId) async {
    try {
      isLoading(false);

      var response = await CartLocalFood.remove(apiKey: apiKey, cartId: cartId);

      if (response.error == false) {
        Get.rawSnackbar(
            backgroundColor: primaryColor,
            message: "Food Item deleted from Cart");
      } else {
        Get.rawSnackbar(
            backgroundColor: primaryColor,
            message: "An Error Occured while Deleting Food Item");
      }
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: "Sorry! Cannot delete Food Item");
    }
    cartFoods.removeWhere((element) => element.id == foodId);
    calculateTotalCost();
    updateCartFood();
    update();
  }

  Future<void> changeQuantity(int foodId, int cartId, int quantity) async {
    try {
      await CartLocalFood.updateCart(
          apiKey: apiKey, cartId: cartId, quantity: quantity.toString());
    } catch (e) {
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: "Sorry! Cannot update Food Item");
      print(errorMessage);
    }
    int index = cartFoods.indexWhere((element) => element.id == foodId);
    cartFoods[index].cartQuantity = quantity.toString();
    calculateTotalCost();
    update();
  }

  void clearCart() {
    cartFoods = [];
    updateCartFood();
    update();
  }
}
