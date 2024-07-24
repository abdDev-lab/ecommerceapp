import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/checkout_remote.dart';
import 'package:ecommerceproject2/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class TakeOrderPageController extends GetxController {
  totalePrice();
  deliveryPress();
  officePress();
}

class TakeOrderPageControllerImp extends TakeOrderPageController {
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> data = [];
  List<CartModel> datareduce = [];
  late TextEditingController couponController;
  late int coupondiscount;
  double totalecartprice = 0.0;
  double totaleprice = 0.0;
  double totalepriceafterdiscount = 0.0;
  double deliveryPrice = 30.0;
  bool deliverySelected = true;
  bool officeSelected = false;
  bool viewall = false;
  @override
  void onInit() {
    data = Get.arguments["cartData"];
    if (data.length > 3) {
      datareduce.addAll(data.take(3));
      viewall = true;
    } else {
      datareduce.addAll(data);
    }
    coupondiscount = myServices.sharedPreferences.getInt("coupondiscount") ?? 0;
    totalecartprice = Get.arguments["totalePrice"];
    couponController = TextEditingController();
    //couponController.text =
       // myServices.sharedPreferences.getString("giftcouponname")!;
    totalePrice();
    super.onInit();
  }

  getcouponData() async {
    if (couponController.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkoutData.getcouponData(couponController.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          couponController.clear();
          myServices.sharedPreferences
              .setInt("coupondiscount", response["data"][0]["coupon_discount"]);

          coupondiscount =
              myServices.sharedPreferences.getInt("coupondiscount")!;
          totalePrice();
        } else {
          Get.showSnackbar(GetSnackBar(
            backgroundColor: Colors.red[100]!,
            messageText: Row(
              children: [
                Icon(
                  UIcons.boldRounded.ticket,
                  size: 20,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "this coupon does not exist",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            snackPosition: SnackPosition.TOP,
            borderRadius: 32,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 16),
          ));
        }
      }
    }
    update();
  }

  @override
  totalePrice() {
    totaleprice = totalecartprice + deliveryPrice;
    totalepriceafterdiscount =
        totaleprice - (totaleprice * coupondiscount / 100);
    update();
  }

  @override
  deliveryPress() {
    deliveryPrice = 30.0;
    deliverySelected = true;
    officeSelected = false;
    totalePrice();
    update();
  }

  @override
  officePress() {
    deliveryPrice = 10.0;
    deliverySelected = false;
    officeSelected = true;
    totalePrice();

    update();
  }

  double formateToTwoDecimalPlaces(double number) {
    String formatnumber = number.toStringAsFixed(2);
    double newNumber = double.parse(formatnumber);
    return newNumber;
  }
}
