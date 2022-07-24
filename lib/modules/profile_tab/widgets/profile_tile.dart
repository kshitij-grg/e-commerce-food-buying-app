import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
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
    return ListTile(
      minLeadingWidth: 10,
      horizontalTitleGap: 10,
      onTap: onPress,
      leading: Icon(
        leadingIcon,
        color: primaryColor,
        size: 22,
      ),
      title: Text(
        label,
        style: TextStyle(color: primaryColor, fontSize: 14),
      ),
      trailing: Icon(
        Icons.chevron_right_outlined,
        color: primaryColor,
        size: 22,
      ),
    );
  }
}
