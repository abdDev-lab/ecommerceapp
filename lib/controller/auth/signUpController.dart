// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/data/datasource/remote/auth/signup_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class SignupController extends GetxController {
  signup();
}

class SignupControllerImp extends SignupController {
  SignUpData signUpData = SignUpData(Get.find());

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  late TextEditingController phonenumber;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

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
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, email.text, password.text, phonenumber.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.signupverify,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Fail Sign Up",
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
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phonenumber = TextEditingController();
    confirmpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    confirmpassword.dispose();
    phonenumber.dispose();

    super.dispose();
  }
}
