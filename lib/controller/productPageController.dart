// ignore_for_file: file_names
import 'package:ecommerceproject2/controller/favoriteContoller.dart';
import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/AppRoutes.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/cart_remote.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class ProductPageContoller extends GetxController {
  initialData();
  addquantite();
  minusquantite();
  changecolor(int index);
  changestorage(int index);
  favorite(int fav);
  setOrder();
  popuppage();
  addCart(
    String productid,
    String productCount,
    String productColor,
    String? productSizeOrStorage,
  );
}

class ProductPageContollerImp extends ProductPageContoller {
  FavoriteContoller favoriteController = Get.find();
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late ProductsModel productsModel;
  int productQ = 1;
  int selectedColor = 0;
  int selectedType = 0;
  int isfavorite = 0;
  late String currentpage;
  List size = [];
  Map data = {};
  Map discountColor = {
    50: Colors.red,
    30: Colors.orange,
    20: const Color.fromARGB(255, 60, 141, 62),
    10: Colors.blueAccent
  };
  List colors = [
    {
      "name": "black",
      "color": Colors.black,
    },
    {
      "name": "red",
      "color": Colors.red,
    },
    {
      "name": "blue",
      "color": Colors.blue,
    }
  ];
  List storages = [
    "64 GB",
    "128 GB",
    "256 GB",
    "512 GB",
    "1 TB",
  ];
  @override
  void onInit() {
    initialData();

    if (productsModel.productCat == 7 || productsModel.productCat == 8) {
      size = [
        "40",
        "41",
        "42",
        "43",
        "44",
      ];
    } else {
      size = [
        "S",
        "M",
        "L",
        "XL",
        "XXL",
      ];
    }
    isfavorite = (productsModel.favorite ?? 1);
    super.onInit();
  }

  @override
  initialData() async {
    productsModel = Get.arguments["productDetail"];
    currentpage = Get.arguments["currentpage"];
    update();
  }

  @override
  addquantite() {
    if (productQ <= productsModel.productCount!) {
      productQ++;
    }
    update();
  }

  @override
  minusquantite() {
    if (productQ >= 2) {
      productQ--;
    }
    update();
  }

  @override
  changecolor(int index) {
    selectedColor = index;
    update();
  }

  @override
  changestorage(int index) {
    selectedType = index;
    update();
  }

  @override
  favorite(int fav) {
    if (fav == 0) {
      isfavorite = 1;
      update();
      favoriteController.onFavorite(productsModel.productId, 1);
      favoriteController.addFavorite(productsModel.productId.toString());
    } else {
      isfavorite = 0;
      update();
      favoriteController.onFavorite(productsModel.productId, 0);
      favoriteController.removeFavorite(productsModel.productId.toString());
    }
    update();
  }

  @override
  setOrder() {
    data = productsModel.catId == 4 ||
            productsModel.catId == 5 ||
            productsModel.subcatId == 3 ||
            productsModel.subcatId == 4
        ? {
            "productCount": productQ,
            "productColor": null,
            "productSizeOrStorage": null
          }
        : {
            "productCount": productQ,
            "productColor": colors[selectedColor]["name"],
            "productSizeOrStorage": productsModel.catId == 2
                ? storages[selectedType]
                : productsModel.catId == 3
                    ? size[selectedType]
                    : null
          };
    update();
  }

  @override
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
                color: Colors.black,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "cartconfirm".tr,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          snackPosition: SnackPosition.TOP,
          borderRadius: 32,
          animationDuration: const Duration(milliseconds: 400),
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(left: 40, right: 40, bottom: 16),
        ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  popuppage() {
    if (currentpage == AppRoutes.home) {
      Get.offAllNamed(currentpage);
    } else {
      Get.back();
    }
  }
}
