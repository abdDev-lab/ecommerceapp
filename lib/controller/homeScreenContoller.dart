// ignore_for_file: file_names

import 'package:ecommerceproject2/controller/cartController.dart';
import 'package:ecommerceproject2/controller/favoritePageContoller.dart';
import 'package:ecommerceproject2/controller/ordersPageController.dart';
import 'package:ecommerceproject2/view/screen/cartpage.dart';
import 'package:ecommerceproject2/view/screen/myorderspage.dart';
import 'package:ecommerceproject2/view/screen/settingspage.dart';
import 'package:ecommerceproject2/view/screen/favoritepage.dart';
import 'package:ecommerceproject2/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  @override
  void onInit() {
    //determinePosition();
    //currentpage = Get.arguments["currentpage"] ?? 0 ;
    super.onInit();
  }

  int currentpage = 0;
  List<Widget> listpages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const MyOrdersPage(),
    const SettingsPage(),
  ];
  List<IconData> listiconsolid = [
    UIcons.solidRounded.home,
    UIcons.solidRounded.heart,
    UIcons.solidRounded.shopping_cart,
    UIcons.solidStraight.box_alt,
    UIcons.solidRounded.settings,
  ];
  List<IconData> listiconrounded = [
    UIcons.regularRounded.home,
    UIcons.regularRounded.heart,
    UIcons.regularRounded.shopping_cart,
    UIcons.regularStraight.box_alt,
    UIcons.regularRounded.settings,
  ];
  @override
  changepage(int i) {
    currentpage = i;

    if (currentpage == 1) {
      Get.delete<FavoritePageContollerImp>();
      Get.put(FavoritePageContollerImp());
    }
    if (currentpage == 2) {
      Get.delete<CartController>();
      Get.put(CartController());
    }
    if (currentpage == 3) {
      Get.delete<OrdersPageControllerImp>();
      Get.put(OrdersPageControllerImp);
    }

    update();
  }
}
