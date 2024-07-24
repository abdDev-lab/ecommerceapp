import 'package:ecommerceproject2/controller/allproductsPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/functions/translate_database.dart';
import 'package:ecommerceproject2/data/model/categorie_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class CostumProductsCategories extends GetView<AllProductsControllerImp> {
  const CostumProductsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 15),
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
          itemCount: controller.categorie.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
              index: index,
              categorieModel:
                  CategorieModel.fromJson(controller.categorie[index]))),
    );
  }
}

class Categories extends GetView<AllProductsControllerImp> {
  final int index;
  final CategorieModel categorieModel;
  const Categories(
      {super.key, required this.index, required this.categorieModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductsControllerImp>(builder: (contoller) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: controller.catselecte == index
                  ? AppColor.mainColor
                  : Theme.of(context).primaryColor,
              border: controller.catselecte == index
                  ? null
                  : Get.isDarkMode
                      ? null
                      : Border.all(color: Colors.black26, width: 2),
              borderRadius: BorderRadius.circular(20)),
          height: 40,
          child: MaterialButton(
            minWidth: 50,
            onPressed: () {
              controller.onChangedcat(categorieModel.catId, index);
              controller.onvisible(controller.catselecte == index, index);
            },
            child: Text(
              "${translateDataBase(categorieModel.catName, categorieModel.catNameAr)}",
              style: TextStyle(
                  fontSize: 17,
                  color: controller.catselecte == index
                      ? Colors.white
                      : Get.isDarkMode
                          ? Colors.white
                          : Colors.black26,
                  fontWeight: FontWeight.w500),
            ),
          ));
    });
  }
}
