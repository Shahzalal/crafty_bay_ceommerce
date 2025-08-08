import 'package:crafty_bay_ecommerce/app/asset_path.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/product_category_item.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/product_search_bar.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ProductSearchBar(),
                const SizedBox(height: 16),
                HomeCarouselSlider(),
                const SizedBox(height: 16),

                _buildSectionHeader(
                  title: 'Categories',
                  onTapApp: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                _getCategoryList(),
                _buildSectionHeader(title: 'Popular', onTapApp: () {}),
                _getPopularProducts(),
                _buildSectionHeader(title: 'Special', onTapApp: () {}),
                _getSpecialProducts(),
                _buildSectionHeader(title: 'New', onTapApp: () {}),
                _getNewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.navAppLogoSvg),
      actions: [
        AppBarIconButton(onTap: () {}, iconData: Icons.person_outline),
        AppBarIconButton(onTap: () {}, iconData: Icons.call_outlined),
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.notification_add_outlined,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapApp,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapApp, child: Text('See All')),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _getPopularProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _getNewProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
      ),
    );
  }
}
