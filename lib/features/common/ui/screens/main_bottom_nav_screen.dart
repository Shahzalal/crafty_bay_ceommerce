import 'package:crafty_bay_ecommerce/features/common/controller/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/screens/product_category_screen.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/features/wish_list/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/ui/screens/cart_screen.dart';
import '../../../home/ui/controllers/home_slider_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name= '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> screens=[
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),

  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getHomeSliders();
    Get.find<CategoryListController>().getCategoryList();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: navController.selectedIndex,
              onDestinationSelected: navController.changeIndex,
              destinations: [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.grid_view_outlined), label: 'Category'),
              NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.card_giftcard_outlined), label: 'Wish'),
              ])
        );
      }
    );
  }
}
