import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_productsize.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_productstorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumProductType extends StatelessWidget {
  const CostumProductType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) =>
          controller.productsModel.subcatId == 1 || controller.productsModel.subcatId == 2  // categorie electronic device
              ? const CostumProductStorage()
              : controller.productsModel.catId == 3 // categorie clothes
                  ? const CostumProductSize()
                  : Container(),
    );
  }
}
