import 'package:crafty_bay_ecommerce/app/urls.dart';
import 'package:crafty_bay_ecommerce/core/services/network/network_client.dart';
import 'package:crafty_bay_ecommerce/features/products/data/models/product_details_model.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  late ProductDetailsModel _productModel;

  ProductDetailsModel get productModel => _productModel;

  Future<bool> getProductDetails(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productDetailsUrl(id),
    );
    if (response.isSuccess) {
      _productModel = ProductDetailsModel.fromJson(
        response.responseData!['data'],
      );
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
