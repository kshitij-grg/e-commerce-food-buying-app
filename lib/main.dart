import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/api/initial_api.dart';
import 'package:food_delivery/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  Get.put(InitialApi());
  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {Key? key}) : super(key: key);
  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_4db0b9479efc444585cab9babed270eb',
        builder: (context, navigatorKey) {
          return GetMaterialApp(
              navigatorKey: navigatorKey,
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ne', 'NP'),
              ],
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ],
              title: 'Food Delivery',
              debugShowCheckedModeBanner: false,

              // setting the font of the whole app
              theme: ThemeData(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

                primaryColor: primaryColor,

                // setting the appbar theme of the whole app
                appBarTheme: const AppBarTheme(
                  color: primaryColor,
                  elevation: 1,

                  //for the status bar of our phone
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: primaryColor,
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light),

                  // to make the appbar a bit curve in the bottom side
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  centerTitle: true,
                  titleTextStyle: TextStyle(fontSize: 18),
                ),
              ),
              initialBinding: BindingsBuilder(() {
                Get.put(AppController(sharedPreferences), permanent: true);
                // Get.put(CartController(), permanent: true);
              }),
              home: SplashScreen());
        });
  }
}
