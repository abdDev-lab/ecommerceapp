import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeProducts extends GetView<HomeControllerImp> {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: controller.popularproduct.length,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Product(
            productsModel:
                ProductsModel.fromJson(controller.popularproduct[index]),
          );
        });
  }
}

class Product extends StatelessWidget {
  final ProductsModel productsModel;
  const Product({
    super.key,
    required this.productsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.product, arguments: {
          "productDetail": productsModel,
          "currentpage": AppRoutes.home,
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: Get.isDarkMode
                ? null
                : [
                    BoxShadow(
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      spreadRadius: 2,

                      blurRadius: 8,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "${productsModel.productId}",
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageslink}/${productsModel.productImage}",
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              "${productsModel.productName}",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "${productsModel.productPrice}\$",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
