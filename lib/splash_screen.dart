import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/modules/auth/front_screen.dart';
import 'package:food_delivery/modules/home_tab/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 70,
              height: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Click to Eat",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: primaryColor)),
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }

  void navigateUser() {
    var status = controller.isLoggedIn.value;
    if (status == true) {
      Get.off(() => const HomeScreen());
    } else {
      Get.off(() => const FrontScreen());
    }
  }
}
