import 'package:crafty_bay_ecommerce/app/urls.dart';
import 'package:crafty_bay_ecommerce/core/services/network/network_client.dart';
import 'package:get/get.dart';

import '../../data/model/verify_otp_request_model.dart';


class VerityOtpController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress =>_inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpRequestModel model) async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>()
    .postRequest(Urls.verifyOtpUrl,body: model.toJson());
    if(response.isSuccess){
      isSuccess=true;
      _errorMessage =null;

    }else{
      _errorMessage=response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSuccess;

  }
}