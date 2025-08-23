import 'package:crafty_bay_ecommerce/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce/features/common/controller/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/widgets/product_category_item.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController =
  Get.find<CategoryListController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Categories'),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (controller) {
            if (controller.initialLoadingInProgress) {
              return CenteredCircularProgressIndicator();
            }

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.categoryModelList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(child: ProductCategoryItem());
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: LinearProgressIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
