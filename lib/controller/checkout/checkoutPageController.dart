import 'dart:async';

import 'package:ecommerceproject2/controller/checkout/takeOrderPageController.dart';
import 'package:ecommerceproject2/controller/checkout/paymentPageController.dart';
import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/checkout_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckOutPageController extends GetxController {
  paymentpage();
  successpage();
  paymentpageimp();
  successpageimp();
  orderscheckout();
}

class CheckOutPageControllerImp extends CheckOutPageController {
  late TakeOrderPageControllerImp ordercontroller;
  late PaymentPageControllerImp paymentcontroller;
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Timer? _timer;
  late PageController pageController;
  int currentpage = 0;
  int indexbuttonName = 0;
  bool backbotton = true;
  List buttonName = ["continue".tr, "paynow".tr, "back".tr];
  @override
  void onInit() {
    pageController = PageController();

    ordercontroller = Get.put(TakeOrderPageControllerImp());
    paymentcontroller = Get.put(PaymentPageControllerImp());
    super.onInit();
  }

  @override
  paymentpage() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  successpage() {
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  paymentpageimp() {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (currentpage == 1) {
        paymentpage();
        indexbuttonName++;
      }
      if (currentpage == 5) {
        _timer!.cancel();
      } else {
        currentpage++;
      }
      update();
    });
  }

  @override
  successpageimp() {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (currentpage == 6) {
        successpage();
        indexbuttonName++;
      }
      if (currentpage == 10) {
        _timer!.cancel();
      } else {
        currentpage++;
      }
      update();
    });
  }

  @override
  orderscheckout() async {
    statusRequest = StatusRequest.loading;
    var response = await checkoutData.checkoutorder(
        myServices.sharedPreferences.getInt("id").toString(),
        myServices.sharedPreferences.getDouble("loc_lat").toString(),
        myServices.sharedPreferences.getDouble("loc_long").toString(),
        ordercontroller.deliverySelected ? "0" : "1",
        ordercontroller.deliveryPrice.toString(),
        ordercontroller.totalepriceafterdiscount.toString(),
        paymentcontroller.cashSelected ? "0" : "1",
        ordercontroller.coupondiscount.toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.remove("coupondiscount");
        successpageimp();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  showbackbotton() {
    backbotton = false;
    update();
  }
}
