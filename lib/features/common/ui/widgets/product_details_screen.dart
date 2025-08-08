import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:crafty_bay_ecommerce/app/constants.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/color_picker.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/inc_dec_button.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static final String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nike 120HST - new shoe of 2025',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            IncDecButton(onChange: (int value) {}),
                          ],
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.star, size: 18, color: Colors.amber),
                                Text('4.5', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            TextButton(onPressed: () {}, child: Text('Reviews')),
                            Card(
                              color: AppColors.themeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Color',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        ColorPicker(
                          colors: ['Black', 'Blue', 'Pink', 'White', 'Yellow'],
                          onSelected: (String value) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Size',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL'],
                          onSelected: (String value) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Description',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
              ''',style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection()

        ],
      ),
    );
  }
  Widget _buildPriceAndAddToCartSection(){
  return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          )
        ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Price',style: Theme.of(context).textTheme.bodyLarge,),
            Text('${Constants.takeSign}100',style:TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.themeColor
            ) ,),
          ],
        ),
        SizedBox(
          width: 120,
          child: ElevatedButton(onPressed: (){}, child: Text('Add to cart')),
        )
      ],
    ),
      );
}


}
