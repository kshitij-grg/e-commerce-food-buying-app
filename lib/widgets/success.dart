import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({this.size = 50, Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Lottie.asset('assets/lottie/done.json',
            repeat: false,
            width: MediaQuery.of(context).size.width * 0.75,
            height: double.infinity),
      ),
    );
  }
}
