
// ignore_for_file: file_names

import 'package:ecommerceproject2/core/constant/AppRoutes.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';

import 'package:ecommerceproject2/data/datasource/static/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPagechange(int val);
}

class OnBoardingControllerimp extends OnBoardingController  {
  MyServices myServices = Get.find() ; 
  late PageController pageController;
  String textButton = "onBoardingButton1".tr;
  int currentpage = 0;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentpage++;
    if (currentpage == 1) {
      textButton = "onBoardingButton2".tr;
    }
    if (currentpage == onBoardinglist.length -1) {
      textButton = "onBoardingButton3".tr;
    }
    if (currentpage == onBoardinglist.length ) {
      myServices.sharedPreferences.setString("step", "1") ; 

      Get.offAllNamed(AppRoutes.login) ; 
      
    }
    pageController.animateToPage(currentpage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    update();
  }

  @override
  onPagechange(int val) {
    currentpage = val;
    if (currentpage == 0) {
      textButton = "onBoardingButton1".tr;
    }
    if (currentpage == 1) {
      textButton = "onBoardingButton2".tr;
    }
    if (currentpage == onBoardinglist.length -1) {
      textButton = "onBoardingButton3".tr;
    }
    update();
  }

}
