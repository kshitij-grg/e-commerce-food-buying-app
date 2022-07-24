import 'package:get/get.dart';
import '../../data/models/food/food.dart';
import '../../data/api/food_api.dart';

class FoodController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";
  List<Foods> foods = [];

  @override
  void onInit() {
    super.onInit();
    getFoods();
  }

  Future<void> getFoods() async {
    isLoading(true);
    isError(false);

    try {
      foods = await FoodApi.getFoods();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);

      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load food";
      }
      errorMessage = e.toString();
      print(errorMessage);
    }
  }
}
