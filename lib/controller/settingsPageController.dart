// ignore_for_file: file_names

import 'package:ecommerceproject2/core/constant/AppRoutes.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class SettingsController extends GetxController {
  changeDarkMode(bool val);
  changeNotification(bool val);
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  bool darkmode = Get.isDarkMode ? true : false;
  bool notification = true;
  bool arabic = true;
  bool english = false;
  @override
  void onInit() {
    changelanguage(Get.locale!.languageCode);
    super.onInit();
  }

  List data = [
    {
      "title": "changepassword".tr,
      "icon": UIcons.regularRounded.lock,
      "onpress": () {},
    },
    //{
    //  "title": "language".tr,
    //  "icon": UIcons.regularRounded.globe,
    //  "onpress": () {
    //    Get.defaultDialog(
    //      radius: 10,
    //      contentPadding: const EdgeInsets.only(left: 16, right: 16),
    //      title: "Choose Language",
    //      titleStyle: const TextStyle(color: Colors.white, fontSize: 2),
    //      content: Column(
    //        children: [
    //          InkWell(
    //            onTap: (){
    //
    //            },
    //            child: Text("arabic"),
    //          )
    //        ],
    //      )
    //    );
    //  },
    //},
    {
      "title": "privacy".tr,
      "icon": UIcons.regularRounded.shield_check,
      "onpress": () {},
    },
    {
      "title": "advance".tr,
      "icon": UIcons.regularRounded.settings,
      "onpress": () {},
    },
    {
      "title": "help".tr,
      "icon": UIcons.solidRounded.info,
      "onpress": () {},
    },
  ];

  @override
  changeDarkMode(bool val) {
    if (val == true) {
      Get.changeThemeMode(ThemeMode.dark );
      myServices.sharedPreferences.setString("theme", "dark");
    } else {
      Get.changeThemeMode(ThemeMode.light);
      myServices.sharedPreferences.setString("theme", "light");
    }
    darkmode = val;
    update();
  }

  changelanguage(String devicelang) {
    if (devicelang == "ar") {
      arabic = true;
      english = false;
    } else {
      arabic = false;
      english = true;
    }
    update();
  }

  @override
  changeNotification(bool val) {
    notification = val;
    if (notification == false) {
      FirebaseMessaging.instance.unsubscribeFromTopic("user");
      FirebaseMessaging.instance.unsubscribeFromTopic(
          "user${myServices.sharedPreferences.getInt("id")}");
    } else {
      FirebaseMessaging.instance.subscribeToTopic("user");
      FirebaseMessaging.instance
          .subscribeToTopic("user${myServices.sharedPreferences.getInt("id")}");
    }
    update();
  }

  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("user");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "user${myServices.sharedPreferences.getInt("id")}");
    myServices.sharedPreferences.clear();

    Get.offAllNamed(AppRoutes.login);
  }
}
