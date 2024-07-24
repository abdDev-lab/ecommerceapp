import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/products_remote.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AllProductsController extends GetxController {
  initialData();
  onvisible(bool selected, int index);
  onChangedcat(int? id, int index);
  onChangedsub(int index);
  getData(String categorieid, String? subid);
  getSearchData();
}

class AllProductsControllerImp extends AllProductsController {
  MyServices myServices = Get.find();
  Productsdata productsdata = Productsdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List categorie = [];
  List subcategorie = [];
  List subSelecteList = [];
  List subSelecteListAr = [];
  List<ProductsModel> product = [];
  List searchproduct = [];
  TextEditingController? searchController;
  bool isSearch = false;
  bool cancelsearch = false;
  int catselecte = 0;
  int? subselecte;
  int? catid;
  bool isvisible = false;
  @override
  initialData() {
    categorie = Get.arguments["categorie"];
    subcategorie = Get.arguments["subcategorie"];
    catselecte = Get.arguments["catselecte"];
    subSelecteList = subcategorie
        .where((element) => element["categorie"] == catselecte)
        .map((e) => e["subcat_name"])
        .toList();
    subSelecteListAr = subcategorie
        .where((element) => element["categorie"] == catid)
        .map((e) => e["subcat_name_ar"])
        .toList();
    getData((catselecte + 1).toString(), (null).toString());
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  onChangedcat(id, index) {
    subselecte = null;
    catselecte = index;
    catid = id;
    subSelecteList = subcategorie
        .where((element) => element["categorie"] == catid)
        .map((e) => e["subcat_name"])
        .toList();
    subSelecteListAr = subcategorie
        .where((element) => element["categorie"] == catid)
        .map((e) => e["subcat_name_ar"])
        .toList();
    getData((catselecte + 1).toString(), (subselecte).toString());
    update();
  }

  @override
  onvisible(selected, index) {
    if (index != 0) {
      isvisible = isvisible == true ? true : !isvisible;
    } else {
      isvisible = false;
    }

    update();
  }

  @override
  onChangedsub(index) {
    subselecte = index;
    getData((catselecte + 1).toString(),
        (subselecte! + ((catselecte - 1) * 4 + 1)).toString());
    update();
  }

  @override
  getData(categorieid, subid) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await productsdata.getData(categorieid, subid,
        myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        product.clear();
        List responsedata = response["data"];
        product.addAll(responsedata.map((e) => ProductsModel.fromJson(e)));
        //product.addAll(response["data"]);
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
    var response = await productsdata.getSearchData(searchController!.text,
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

  checkSearch(val) {
    if (val != "") {
      isSearch = true;
      cancelsearch = true;
    } else {
      searchproduct.clear();
      isSearch = false;
      cancelsearch = true;
    }
    update();
  }

  onCancel() {
    cancelsearch = false;
    searchController!.clear();
    checkSearch("");
    update();
  }

}
