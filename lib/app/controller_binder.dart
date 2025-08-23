import 'package:crafty_bay_ecommerce/core/services/network/network_client.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/controller/login_controller.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay_ecommerce/features/common/controller/auth_controller.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/features/home/ui/controllers/home_slider_controller.dart';
import 'package:get/get.dart';

import '../features/auth/ui/controller/verity_otp_controller.dart';
import '../features/common/controller/category_list_controller.dart';

class ControllerBinder extends Bindings {
  final AuthController _authController = AuthController();
  @override
  void dependencies() {
    Get.put(_authController);
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: _commonHeaders,
      ),
    );
    Get.put(SignUpController());
    Get.put(VerityOtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
  }

  Future<void> _onUnAuthorize() async {
    await _authController.clearUserData();
    Get.to(()=>LoginScreen());
  }
  Map<String, String>get  _commonHeaders {
    return{
    'content-type': 'application/json',
      'token':_authController.accessToken ?? '',
    };
  }
}
