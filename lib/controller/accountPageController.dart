// ignore_for_file: file_names

import 'dart:io';

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/account_remote.dart';
import 'package:ecommerceproject2/view/widget/accountPageWidgets/costum_pickeImage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AccountPageController extends GetxController {
  updateUserData();
  updateUserDataWithImage();
  updateUserDataWithOutImage();
  pickImage();
}

class AccountPageControllerImp extends AccountPageController {
  Accountdata accountdata = Accountdata(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  File? myfile;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late String userimage;

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    usernameController.text = Get.arguments["username"];
    emailController.text = Get.arguments["email"];
    userimage = Get.arguments["image"];
    super.onInit();
  }

  @override
  updateUserData() {
    if (myfile != null) {
      updateUserDataWithImage();
    } else {
      updateUserDataWithOutImage();
    }
    update();
  }

  @override
  pickImage() {
    Get.bottomSheet(const CostumPickeImage());
  }

  @override
  updateUserDataWithImage() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await accountdata.updateUserDatawithimage(
        myServices.sharedPreferences.getInt("id").toString(),
        usernameController.text,
        myfile!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.remove("username");
        myServices.sharedPreferences
            .setString("username", response['data']['user_name']);
        myServices.sharedPreferences.remove("image");
        myServices.sharedPreferences
            .setString("image", response['data']['user_image']);
        Get.offAllNamed(AppRoutes.account, arguments: {
          "username": myServices.sharedPreferences.getString("username")!,
          "email": myServices.sharedPreferences.getString("email")!,
          "image": myServices.sharedPreferences.getString("image")!
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  updateUserDataWithOutImage() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await accountdata.updateUserData(
      myServices.sharedPreferences.getInt("id").toString(),
      usernameController.text,
    );
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.remove("username");
        myServices.sharedPreferences
            .setString("username", response['data']['user_name']);
      }
    }

    Get.offAllNamed(AppRoutes.home);
  }
}
