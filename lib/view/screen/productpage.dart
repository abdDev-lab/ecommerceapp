import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_bottombar.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_colorprodut.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_imageproduct.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_productinfo.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_productstype.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_quantite.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductPageContollerImp());

    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CostumBottomBar(
          price: "${controller.productsModel.productPrice}",
          id: controller.productsModel.productId!,
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: IconButton(
                      onPressed: () {
                        controller.popuppage();
                      },
                      icon: Icon(UIcons.regularRounded.angle_left)),
                )
              ],
            ),
            Hero(
              tag: "${controller.productsModel.productId}",
              child: CostumImageProduct(
                  imagename: "${controller.productsModel.productImage}"),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      spreadRadius: 2,

                      blurRadius: 8,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumProductInfo(
                      title: "${controller.productsModel.productName}",
                      rating: controller.productsModel.productRating!,
                      desc: "${controller.productsModel.productDesc}"),
                  const CostumQuantite(),
                  controller.productsModel.catId == 4 || //accessories categorie
                          controller.productsModel.catId == 5 ||
                          controller.productsModel.subcatId == 3 ||
                          controller.productsModel.subcatId == 4
                      ? Container(height: 70,)
                      : CostumColorProduct(),
                  const CostumProductType(),
                  //CostumProductStorage(),
                  //CostumProductSize(),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
