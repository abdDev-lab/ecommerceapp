// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/cart_remote.dart';
import 'package:ecommerceproject2/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List<CartModel> data = [];
  double totalPrice = 0;
  int productcount = 0;
  bool button = false;

  addCart(
    String productid,
    String productCount,
    String productColor,
    String? productSizeOrStorage,
  ) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        productid,
        myServices.sharedPreferences.getInt("id").toString(),
        productCount,
        productColor,
        productSizeOrStorage);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: const Color.fromRGBO(200, 247, 200, 1.0),
          messageText: Row(
            children: [
              Icon(
                UIcons.boldRounded.shopping_cart_check,
                size: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "the item added to your cart",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          snackPosition: SnackPosition.TOP,
          borderRadius: 32,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(left: 40, right: 40, bottom: 16),
        ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeCart(String productid, String cartid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(productid,
        myServices.sharedPreferences.getInt("id").toString(), cartid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        button = false;
        data.clear();
        getDataCart();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  updatecountproductCart(String cartid, String productCount) async {
    var response = await cartData.updatecountproductCart(cartid,
        myServices.sharedPreferences.getInt("id").toString(), productCount);
    if (response['status'] == "success") {
      updateDataCart();
    }
  }

  getDataCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .getDataCart(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.reversed.map((e) => CartModel.fromJson(e)));
        totalPrice =
            formateToTwoDecimalPlaces(response["price"]["totaleprice"]);
        visibilityButton();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  updateDataCart() async {
    var response = await cartData
        .getDataCart(myServices.sharedPreferences.getInt("id").toString());
    if (response['status'] == "success") {
      data.clear();
      List responsedata = response["data"];
      data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
    }
    update();
  }

  double formateToTwoDecimalPlaces(double number) {
    String formatnumber = number.toStringAsFixed(2);
    double newNumber = double.parse(formatnumber);
    return newNumber;
  }

  @override
  void onInit() {
    getDataCart();
    visibilityButton();
    super.onInit();
  }

  visibilityButton() {
    if (data.isEmpty || statusRequest == StatusRequest.loading) {
      button = false;
    } else {
      button = true;
    }
    update();
  }
}
