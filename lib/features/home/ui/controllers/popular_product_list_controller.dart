import 'package:crafty_bay_ecommerce/app/urls.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../../common/models/product_model.dart';

class PopularProductController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<ProductModel> _productModelList = [];

  List<ProductModel> get productModelList => _productModelList;

  Future<bool> getPopularProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productsByTagUrl('Popular'),
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(slider));
      }
      _productModelList = list;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
