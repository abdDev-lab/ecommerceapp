// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/statusrequest.dart';

import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/constant/appasset.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';

import 'package:ecommerceproject2/data/datasource/remote/home_remote.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getData();
  getSearchData();
  onpagechange(int val);
  String setBackground(int cat);
  gotoallproductspage(List categorie, int catselecte);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  Homedata homedata = Homedata(Get.find());
  late PageController pageController;
  Color fillcolor = Colors.white;
  int isCatSelected = 0;
  int currentpage = 0;
  String backgroundColor = AppAsset.backgroundDevice;
  TextEditingController? searchController;
  bool isSearch = false;
  bool gifticon = false;
  bool cancelsearch = false;
  int randomitme = 0;
  int? giftcoupondiscount;
  String? giftcouponname;
  List categorie = [];
  List subcategorie = [];
  List popularproduct = [];
  List searchproduct = [];
  List discountproduct = [];
  List reducediscountproduct = [];

  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    getData();
   //getGiftCouponData();
    pageController = PageController();
    searchController = TextEditingController();

    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categorie.addAll(response["categorie"]);
        subcategorie.addAll(response["subcategorie"]);
        popularproduct.addAll(response["popularproduct"]);
        discountproduct.addAll(response["bigdiscountproduct"]);
        reducediscountproduct.addAll(discountproduct.take(3));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getSearchData(searchController!.text,
        myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchproduct.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

//Categorie list

  @override
  onpagechange(val) {
    currentpage = val;
    update();
  }

  @override
  gotoallproductspage(categorie, catselecte) {
    Get.toNamed(AppRoutes.allproducts, arguments: {
      "categorie": categorie,
      "subcategorie": subcategorie,
      "catselecte": catselecte,
    });
  }

  checkSearch(val) {
    if (val != "") {
      isSearch = true;
      cancelsearch = true;
    } else {
      searchproduct.clear();
      isSearch = false;
      cancelsearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    
    update();
  }

  onCancel() {
    cancelsearch = false;
    searchController!.clear();
    checkSearch("");
    update();
  }

  @override
  setBackground(int cat) {
    if (cat == 4) {
      return AppAsset.backgroundCook;
    } else {
      return AppAsset.backgroundDevice;
    }
  }

  // getGiftCouponData() async {
  //   var response = await homedata.getGiftCoupon();

  //   if (response['status'] == "success") {
  //     giftcoupondiscount = response["data"]["coupon_discount"];
  //     giftcouponname = response["data"]["coupon_name"];
  //     gifticon = true;
  //     print("add gift");
  //   } else {
  //     gifticon = false;
  //   }

  //   update();
  // }

  redeemCode() {
    myServices.sharedPreferences
        .setInt("giftcoupondiscount", giftcoupondiscount!);
    myServices.sharedPreferences.setString("giftcouponname", giftcouponname!);
    gifticon = false;
    Get.back();
  }
}
