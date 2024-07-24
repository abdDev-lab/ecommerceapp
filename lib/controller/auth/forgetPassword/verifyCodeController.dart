// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/data/datasource/remote/auth/forgetpassword_remote/verifycode_remote.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(verifycode);
  resendCode() ; 
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequest statusRequest  = StatusRequest.none;
  String? email;
  @override
  checkCode(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verifycode);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetpassword ,  arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(
          title: "Wrong Code",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
  @override
  resendCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.resendData(email!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.defaultDialog(title: "check your email");
      }
    }
    update();
  }
}
