import 'package:flutter/material.dart';

import '../constants.dart';

class HorizontalListTile extends StatelessWidget {
  const HorizontalListTile(
    this.label, {
    required this.leadingIcon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final IconData leadingIcon;
  final String label;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            leadingIcon,
            color: primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            label,
            style: TextStyle(color: primaryColor),
          )),
          Icon(
            Icons.chevron_right,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
