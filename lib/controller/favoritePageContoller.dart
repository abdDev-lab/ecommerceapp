// ignore_for_file: file_names
import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/favoriteproduct_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoritePageContoller extends GetxController {
  getData();
}

class FavoritePageContollerImp extends FavoritePageContoller {
  MyServices myServices = Get.find();
  FavoriteProductdata favoriteProductdata = FavoriteProductdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List favoriteproducts = [];
  Map discountColor = {
    50: Colors.red,
    30: Colors.orange,
    20: const Color.fromARGB(255, 60, 141, 62),
    10: Colors.blueAccent
  };
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteProductdata
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        favoriteproducts = response["data"];
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
