import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _backToHome();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Wishlist'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, _) {
          _backToHome();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCard());
            },
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
