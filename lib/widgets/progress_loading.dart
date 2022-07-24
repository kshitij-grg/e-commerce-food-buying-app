import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({this.size = 50, Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Lottie.asset(
          'assets/lottie/progress-loading.json',
          width: size,
        ),
      ),
    );
  }
}
