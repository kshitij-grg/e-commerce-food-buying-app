import 'package:flutter/material.dart';
import 'package:food_delivery/app_controller.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/profile_tab/change_password_screen.dart';
import 'package:food_delivery/modules/profile_tab/manage_profile_screen.dart';
import 'package:food_delivery/modules/profile_tab/password_controller.dart';
import 'package:get/get.dart';
import '../../widgets/horizontal_list_tile.dart';
import '../../modules/order/order_screen.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    Get.put(PasswordController());
    final controller = Get.find<AppController>();
    return Scaffold(
      backgroundColor: lightGray,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/jett.jpg'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.getName(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getEmail(),
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalListTile(
                      "Manage Profile",
                      leadingIcon: Icons.person_outline,
                      onPress: () {
                        Get.to(() => ManageProfileScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalListTile(
                      "Change Password",
                      leadingIcon: Icons.lock_open_outlined,
                      onPress: () {
                        Get.to(() => ChangePasswordScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "My orders",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalListTile(
                      "Order Details",
                      leadingIcon: Icons.list_alt,
                      onPress: () {
                        Get.to(() => OrderScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalListTile(
                      "Logout",
                      leadingIcon: Icons.logout_outlined,
                      onPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text('Are you sure want to Logout?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          controller.logout();
                                        },
                                        child: Text('Logout')),
                                  ],
                                ));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
