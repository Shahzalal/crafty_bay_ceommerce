import 'package:crafty_bay_ecommerce/app/asset_path.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = '/home';

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
                _buildSectionHeader(title: 'Categories',onTapApp: (){}),
                _buildSectionHeader(title: 'Popular',onTapApp: (){}),
                _buildSectionHeader(title: 'Special',onTapApp: (){}),
                _buildSectionHeader(title: 'New',onTapApp: (){}),

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
        const SizedBox(width: 8,)
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
        TextButton(onPressed: () {}, child: Text('See All')),
      ],
    );
  }
}
