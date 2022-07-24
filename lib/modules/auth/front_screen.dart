import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/auth/login/login_screen.dart';
import 'package:food_delivery/modules/auth/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/logo.png',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Click to Eat',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: primaryColor)),
        ),
        SvgPicture.asset(
          'assets/icons/front.svg',
          height: MediaQuery.of(context).size.height * 0.55,
        ),
        CustomButton(
          label: 'Register',
          onPress: () {
            Get.to(() => const RegisterScreen());
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          label: 'Login',
          onPress: () {
            Get.to(() => const LoginScreen());
          },
        ),
      ]),
    )));
  }
}
