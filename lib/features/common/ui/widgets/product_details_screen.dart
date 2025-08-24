import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:crafty_bay_ecommerce/app/constants.dart';
import 'package:crafty_bay_ecommerce/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce/core/ui/widgets/snack_bar_message.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay_ecommerce/features/common/controller/auth_controller.dart';
import 'package:crafty_bay_ecommerce/features/products/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/color_picker.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/inc_dec_button.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/data/models/product_details_model.dart';
import '../../controller/product_details_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static final String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
  ProductDetailsController();
  final AddToCartController _addToCartController =
  Get.find<AddToCartController>();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (_) {
          if (_productDetailsController.inProgress) {
            return CenteredCircularProgressIndicator();
          }
          if (_productDetailsController.errorMessage != null) {
            return Center(child: Text(_productDetailsController.errorMessage!));
          }
          final ProductDetailsModel product =
              _productDetailsController.productModel;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(image: product.photoUrls),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.title,
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
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Reviews'),
                                ),
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
                            Visibility(
                              visible: product.colors.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            ColorPicker(
                              colors: product.colors,
                              onSelected: (String value) {},
                            ),
                            const SizedBox(height: 16),
                            Visibility(
                              visible: product.sizes.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizePicker(
                              sizes: product.sizes,
                              onSelected: (String value) {},
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(product),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel product) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge),
              Text(
                '${Constants.takeSign}${product.currentPrice}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder(
              init: _addToCartController,
              builder: (_) {
                return Visibility(
                  visible: _addToCartController.inProgress == false,
                  replacement: CenteredCircularProgressIndicator(),

                  child: ElevatedButton(
                    onPressed: _onTapAddToCartButton,
                    child: Text('Add to cart'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCartButton() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      final bool result = await _addToCartController.addToCart(
          widget.productId);
      if (result) {
        showSnackBarMessage(context, 'Added to cart');
      } else {
        showSnackBarMessage(context, _addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
