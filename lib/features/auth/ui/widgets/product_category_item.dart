import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.computer, color: AppColors.themeColor, size: 32),
          ),
          Text(
            'Computer',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}
