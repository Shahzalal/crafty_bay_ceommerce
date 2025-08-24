import 'package:crafty_bay_ecommerce/app/app_colors.dart';

import 'package:crafty_bay_ecommerce/app/constants.dart';
import 'package:crafty_bay_ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:crafty_bay_ecommerce/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(
                cartItemModel.productModel.photoUrls.first,
                height: 100,
                width: 100,
                errorBuilder: (_, __, ___) {
                  return Center(child: Icon(Icons.error_outline));
                },
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: Text(cartItemModel.productModel.title,
                            style: TextStyle(fontSize: 20),)),
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.delete_outline, color: Colors
                                  .red,))
                        ],
                      ),
                      Row(
                        children: [
                          Text('Color: ${cartItemModel.color}'),
                          Text('Size: ${cartItemModel.size}'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            '${Constants.takeSign}${cartItemModel.productModel
                                .currentPrice}',
                            style: TextStyle(fontSize: 18, color: AppColors
                                .themeColor, fontWeight: FontWeight.w500),),
                          IncDecButton(onChange: (int value) {
                            Get.find<CartListController>().updateQuantity(
                                cartItemModel.id, value);
                          })
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}