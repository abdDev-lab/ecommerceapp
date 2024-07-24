// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/favorite_remote.dart';
import 'package:get/get.dart';

class FavoriteContoller extends GetxController {
  Favoritedata favoritedata = Favoritedata(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Map favorite = {};
  List data = [];
  onFavorite(id, val) {
    favorite[id] = val;
    update() ; 
  }
  addFavorite(String productid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.addFav(
        productid, myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String productid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.removeFav(
        productid, myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
