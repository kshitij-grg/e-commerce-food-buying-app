import 'package:get/get.dart';
import '../../data/models/food/category.dart';
import '../../data/api/food_api.dart';

class CategoryController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";
  List<Categories> categories = [];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    isLoading(true);
    isError(false);

    try {
      categories = await FoodApi.getCategories();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);

      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load category";
      }
      errorMessage = e.toString();
      print(errorMessage);
    }
  }
}
