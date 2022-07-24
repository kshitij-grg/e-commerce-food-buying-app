import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  IconTile({
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(360), boxShadow: [
        BoxShadow(
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
            color: Colors.grey.shade500)
      ]),
      child: Image.asset(
        iconPath,
        width: 36,
        height: 36,
      ),
    );
  }
}
