import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:crafty_bay_ecommerce/app/asset_path.dart';
import 'package:crafty_bay_ecommerce/app/constants.dart';
import 'package:crafty_bay_ecommerce/features/products/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
              child: Image.asset(
                AssetPath.dummyNikeShoe,
                height: 100,
                width: 100,
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: Text('New Year Special Shoe',style: TextStyle(fontSize: 20),)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: Colors.red,))
                        ],
                      ),
                      Row(
                        children: [
                          Text('Color: Red '),
                          Text('Size: X'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('${Constants.takeSign}100',style: TextStyle(fontSize: 18,color: AppColors.themeColor,fontWeight: FontWeight.w500),),
                          IncDecButton(onChange: (int value){})
                        ],
                      ),
                    ],
                  ),
                ) )
          ],
        ),
      ),
    );
  }
}
