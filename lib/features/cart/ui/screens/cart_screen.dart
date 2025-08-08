import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:crafty_bay_ecommerce/app/constants.dart';
import 'package:crafty_bay_ecommerce/features/cart/ui/widgets/cart_item.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:
          _backToHome
              , icon: Icon(Icons.arrow_back_ios,)),
          title: Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CartItem();
                      },
                      separatorBuilder: (_,__) => const SizedBox(height: 4,),
                    ),
                  ))
                ],
              ),
            ),
            _buildPriceAndAddCheckOut(),

          ],
        ),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }

  Widget _buildPriceAndAddCheckOut(){
    return Container(
      padding: EdgeInsets.all(20),
      decoration:BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.3),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )
      ) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price'),
              Text('${Constants.takeSign}10000.00',style: TextStyle(color: AppColors.themeColor,fontSize: 18,fontWeight: FontWeight.w500)
                ,)
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: (){}, child: Text('Checkout')),
          )
        ],
      ),
    );
  }
}
