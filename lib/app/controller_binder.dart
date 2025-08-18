import 'package:crafty_bay_ecommerce/core/services/network/network_client.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: _commonHeaders,
      ),
    );
    Get.put(SignUpController());
  }

  void _onUnAuthorize() {}
  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
