import 'package:ecommerceproject2/controller/cardProductController.dart';
import 'package:ecommerceproject2/controller/cartProductCountController.dart';
import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/controller/favoriteContoller.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_searchList.dart';
import 'package:ecommerceproject2/view/widget/homeWidget/costumdotehome.dart';

import 'package:ecommerceproject2/view/widget/homeWidget/costumhead.dart';
import 'package:ecommerceproject2/view/widget/homeWidget/costumheadcard.dart';
import 'package:ecommerceproject2/view/widget/homeWidget/costumhomecategories.dart';

import 'package:ecommerceproject2/view/widget/homeWidget/costumsubtitle.dart';
import 'package:ecommerceproject2/view/widget/homeWidget/homeproducts.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_searchBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteContoller());
    Get.put(HomeControllerImp());
    Get.put(CardProductController());
    Get.put(CartProductCountController());
    return SafeArea(
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView(
            padding: const EdgeInsets.only(left: 16, right: 16),
            children: [
              const CostumHeadHome(),
              CostumSearchBar(
                mycontroler: controller.searchController!,
                cancelvisible: controller.cancelsearch,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onSubmitted: (val) {
                  if (val != "") {
                    controller.getSearchData();
                  }
                },
                onCancel: () {
                  controller.onCancel();
                },
              ),
              Container(
                height: 20,
              ),
              controller.isSearch == false
                  ? HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CostumHeadCard(),
                          Container(
                            height: 10,
                          ),
                          const CostumeDoteHome(),
                          Container(
                            height: 5,
                          ),
                          Text(
                            "category".tr,
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 21),
                          ),
                          CostumHomeCategories(),
                          CostumSubTitle(
                            title: "popular".tr,
                            onpress: () {
                              controller.gotoallproductspage(
                                controller.categorie,
                                controller.isCatSelected,
                              );
                            },
                          ),
                          Container(
                            height: 16,
                          ),
                          const HomeProducts(),
                        ],
                      ),
                      pageroute: AppRoutes.home)
                  : HandlingData(
                      pageroute: AppRoutes.home,
                      statusRequest: controller.statusRequest,
                      widget: const CostumSearchList(),
                    ),
              Container(
                height: 10,
              )
            ]),
      ),
    );
  }
}
