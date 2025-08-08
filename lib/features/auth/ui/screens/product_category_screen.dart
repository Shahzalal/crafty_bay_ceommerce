import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  static final String name='/product-category';

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              mainAxisSpacing: 6,
              crossAxisSpacing: 2
            ),
            itemBuilder: (context,index){
            return FittedBox(child: ProductCategoryItem());
            }),
      ),
    );
  }
}
