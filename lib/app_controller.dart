import 'package:food_delivery/data/models/auth/login_response.dart';
import 'package:food_delivery/modules/auth/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  final SharedPreferences sharedPreferences;
  final isLoggedIn = false.obs;
  final isNoInternet = false.obs;

  AppController(this.sharedPreferences) {
    String? apiKey = sharedPreferences.getString('apiKey');

    if (apiKey == "" || apiKey == null) {
      isLoggedIn(false);
    } else {
      isLoggedIn(true);
    }
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
  }

  String getToken() {
    return sharedPreferences.getString('apiKey') ?? '';
  }

  String getName() {
    return sharedPreferences.getString('name') ?? '';
  }

  String getEmail() {
    return sharedPreferences.getString('email') ?? '';
  }

  String getPhnNum() {
    return sharedPreferences.getString('phnNum') ?? '';
  }

  String getPassword() {
    return sharedPreferences.getString('password') ?? '';
  }

  void logout() {
    sharedPreferences.setString('apiKey', '');
    sharedPreferences.setString('name', '');
    sharedPreferences.setString('email', '');
    sharedPreferences.setString('phnNum', '');
    sharedPreferences.setString('password', '');
    isLoggedIn(false);
    Get.offAll(LoginScreen());
  }
}
