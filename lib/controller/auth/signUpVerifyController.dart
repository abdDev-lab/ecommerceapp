// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/data/datasource/remote/auth/signupverifycode_remote.dart';

import 'package:get/get.dart';

abstract class SignUpVerifyCodeController extends GetxController {
  checkCode(verifycode);
  resendCode();
}

class SignUpVerifyCodeControllerImp extends SignUpVerifyCodeController {
  SignupVerifyRemote signUpVerify = SignupVerifyRemote(Get.find());
  StatusRequest? statusRequest;
  String? email;

  @override
  checkCode(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpVerify.postData(verifycode, email!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.successSignup);
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
    var response = await signUpVerify.resendData(email!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.defaultDialog(title: "check your email");
      }
    }
    update();
  }
}
