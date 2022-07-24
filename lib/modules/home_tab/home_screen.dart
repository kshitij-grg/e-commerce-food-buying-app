import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/modules/cart_tab/cart_screen.dart';
import 'package:food_delivery/modules/explore_tab/explore_screen.dart';
import 'package:food_delivery/modules/more_tab/more_screen.dart';
import 'package:food_delivery/modules/profile_tab/profile_screen.dart';
import 'package:get/get.dart';
import '../../modules/cart_tab/cart_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // to determine in which screen we are in
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    // making a list of screens so we can swap it while using bottom navbar
    final List<Widget> screens = [
      ExploreScreen(),
      const CartScreen(),
      ProfileScreen(),
      const MoreScreen()
    ];

    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
              children: screens),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: primaryColor,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_basket_outlined),
              title: const Text('Cart'),
              activeColor: primaryColor,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              activeColor: primaryColor,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.more_horiz_outlined),
              title: const Text('More'),
              activeColor: primaryColor,
            ),
          ],
        ));
  }
}
