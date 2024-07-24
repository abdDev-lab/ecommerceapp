import 'package:ecommerceproject2/controller/allproductsPageController.dart';
import 'package:ecommerceproject2/controller/favoriteContoller.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_productCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumSearchProducts extends StatelessWidget {
  const CostumSearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteContoller contollerFav = Get.find();
    return GetBuilder<AllProductsControllerImp>(
      builder: (controller) => GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75),
          itemCount: controller.searchproduct.length,
          itemBuilder: (context, index) {
            contollerFav.onFavorite(
                controller.searchproduct[index]['product_id'],
                controller.searchproduct[index]['favorite']);
            return CostumProductsCard(
              productsModel:
                  ProductsModel.fromJson(controller.searchproduct[index]),
            );
          }),
    );
  }
}
