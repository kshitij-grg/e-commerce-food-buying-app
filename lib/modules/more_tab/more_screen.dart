import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/more_tab/about_us_screen.dart';
import 'package:food_delivery/modules/more_tab/feedback_screen.dart';
import 'package:food_delivery/modules/more_tab/terms_conditions_screen.dart';
import 'package:food_delivery/modules/profile_tab/app_facebook_screen.dart';
import 'package:food_delivery/modules/profile_tab/app_instragram_screen.dart';
import 'package:food_delivery/modules/profile_tab/app_twitter_screen.dart';
import 'package:get/get.dart';
import '../../modules/profile_tab/widgets/profile_tile.dart';
import '../../widgets/horizontal_list_tile.dart';
import 'widgets/icon_tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalListTile(
              "About Us",
              leadingIcon: Icons.info_outline,
              onPress: () {
                Get.to(() => AboutUsScreen());
              },
            ),
            SizedBox(
              height: 20,
            ),
            HorizontalListTile(
              "Provide Feedback",
              leadingIcon: Icons.feedback_outlined,
              onPress: () {
                Get.to(() => FeedbackScreen());
              },
            ),
            SizedBox(
              height: 20,
            ),
            HorizontalListTile(
              "Terms and Conditions",
              leadingIcon: Icons.list_alt,
              onPress: () {
                Get.to(() => TermsAndConditionsScreen());
              },
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Get.to(() => AppFacebookScreen());
                    },
                    child: IconTile(iconPath: 'assets/images/facebook.png')),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => AppInstagramScreen());
                    },
                    child: IconTile(iconPath: 'assets/images/instagram.png')),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => AppTwitterScreen());
                    },
                    child: IconTile(iconPath: 'assets/images/twitter.png')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
