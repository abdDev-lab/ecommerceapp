import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/core/functions/translate_database.dart';

import 'package:ecommerceproject2/data/model/categorie_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class CostumHomeCategories extends StatelessWidget {
  HomeControllerImp controller = Get.find();
  CostumHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
          padding: const EdgeInsets.all(10),
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

class Categories extends GetView<HomeControllerImp> {
  final int index;
  final CategorieModel categorieModel;
  const Categories(
      {super.key, required this.index, required this.categorieModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: Get.isDarkMode
                ? null
                : [
                    BoxShadow(
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      spreadRadius: 2,

                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
            borderRadius: BorderRadius.circular(20)),
        child: MaterialButton(
          minWidth: 50,
          onPressed: () {
            controller.gotoallproductspage(controller.categorie, index);
          },
          child: Text(
            "${translateDataBase(categorieModel.catName, categorieModel.catNameAr)}",
            style: TextStyle(
                fontSize: 17,
                color: Get.isDarkMode ? const Color.fromARGB(255, 245, 244, 244) : Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
