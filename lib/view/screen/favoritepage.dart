import 'package:ecommerceproject2/controller/favoritePageContoller.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';
import 'package:ecommerceproject2/view/widget/favoritewidget/costum_favoriteCard.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_titlePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageContollerImp());
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<FavoritePageContollerImp>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.only(left: 16, right: 16),
          children: [
             CostumTitlePage(title: "favoritetitle".tr),
            HandlingData(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75),
                  itemCount: controller.favoriteproducts.length,
                  itemBuilder: (context, index) {
                    return CostumFavoriteCard(
                        productsModel: ProductsModel.fromJson(controller.favoriteproducts[index]),
                            );
                  }),
              pageroute: AppRoutes.home,
            )
          ],
        );
      })),
    );
  }
}
