// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/auth/login_remote.dart';
import 'package:ecommerceproject2/view/widget/locationWidgets/locationPermission.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late bool isvisible = true;
  late IconData lockicon = UIcons.regularRounded.lock;
  isVisible() {
    isvisible = !isvisible;
    lockicon = isvisible == false
        ? UIcons.regularRounded.unlock
        : UIcons.regularRounded.lock;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_aprove'] == 1) {
            myServices.sharedPreferences
                .setInt("id", response['data']['user_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['user_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['user_email']);
            myServices.sharedPreferences
                .setInt("phone", response['data']['user_phone']);
            myServices.sharedPreferences
                .setString("image", response['data']['user_image']);
            myServices.sharedPreferences.setString("step", "2");
            myServices.sharedPreferences
                .setString("lang", Get.deviceLocale!.languageCode);
            determinePosition();
            FirebaseMessaging.instance.subscribeToTopic("user");
            FirebaseMessaging.instance.subscribeToTopic(
                "user${myServices.sharedPreferences.getInt("id")}");

            Get.offNamed(AppRoutes.home);
          } else {
            Get.toNamed(AppRoutes.signupverify, arguments: {
              "email": email.text,
            });
          }
        } else if (response['status'] == "wrong_password") {
          Get.defaultDialog(
            title: "Fail Login",
            content: const Text("wrong password"),
          );
          statusRequest = StatusRequest.failure;
        } else {
          Get.defaultDialog(
            title: "Fail Login",
            content: const Text("there no user with this email"),
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

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
