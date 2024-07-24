// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/data/datasource/remote/auth/forgetpassword_remote/resetpassword_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController confirmpassword;
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late bool isvisible1 = true;
  late IconData lockicon1 = UIcons.regularRounded.lock;

  late bool isvisible2 = true;
  late IconData lockicon2 = UIcons.regularRounded.lock;
  isVisiblePass() {
    isvisible1 = !isvisible1;
    lockicon1 = isvisible1 == false
        ? UIcons.regularRounded.unlock
        : UIcons.regularRounded.lock;
    update();
  }

  isVisibleConfpass() {
    isvisible2 = !isvisible2;
    lockicon2 = isvisible2 == false
        ? UIcons.regularRounded.unlock
        : UIcons.regularRounded.lock;
    update();
  }

  @override
  resetPassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Warning",
            content: const Text("Phone Number or Email already exist"),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmpassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmpassword.dispose();

    super.dispose();
  }
}
