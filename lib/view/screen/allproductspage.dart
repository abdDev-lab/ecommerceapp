import 'package:ecommerceproject2/controller/allproductsPageController.dart';
import 'package:ecommerceproject2/controller/favoriteContoller.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/AppRoutes.dart';
import 'package:ecommerceproject2/view/widget/allProductsPageWidgets/costumheadproducts.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_productCard.dart';
import 'package:ecommerceproject2/view/widget/allProductsPageWidgets/costumsearchproducts.dart';
import 'package:ecommerceproject2/view/widget/allProductsPageWidgets/costumproducscategorie.dart';
import 'package:ecommerceproject2/view/widget/allProductsPageWidgets/costumproductssubCat.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_searchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllProductsControllerImp());
    FavoriteContoller contollerFav = Get.find();
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AllProductsControllerImp>(
            builder: (controller) => ListView(
                  children: [
                    CostumHeadProducts(
                      image: controller.myServices.sharedPreferences
                          .getString("image")!,
                      onPressedback: () {
                        Get.offAllNamed(AppRoutes.home, arguments: {
                          "currentpage": Get.currentRoute,
                        });
                      },
                      onPressedaccount: () {
                        Get.toNamed(AppRoutes.account, arguments: {
                          "username": controller.myServices.sharedPreferences
                              .getString("username")!,
                          "email": controller.myServices.sharedPreferences
                              .getString("email")!,
                          "image": controller.myServices.sharedPreferences
                              .getString("image")!
                        });
                      },
                    ),
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
                    controller.isSearch == false
                        ? Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16),
                                child: const Column(
                                  children: [
                                    CostumProductsCategories(),
                                    CostumProductsSubCategorie()
                                  ],
                                ),
                              ),
                              HandlingDataRequest(
                                pageroute: AppRoutes.home,
                                statusRequest: controller.statusRequest,
                                widget: GridView.builder(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 0.75),
                                    itemCount: controller.product.length,
                                    itemBuilder: (context, index) {
                                      contollerFav.onFavorite(
                                          controller.product[index].productId,
                                          controller.product[index].favorite);
                                      return CostumProductsCard(
                                        productsModel:
                                            controller.product[index],
                                      );
                                    }),
                              ),
                            ],
                          )
                        : HandlingData(
                            statusRequest: controller.statusRequest,
                            widget: const CostumSearchProducts(),
                            pageroute: AppRoutes.home),
                    Container(
                      height: 20,
                    )
                  ],
                )),
      ),
    );
  }
}
