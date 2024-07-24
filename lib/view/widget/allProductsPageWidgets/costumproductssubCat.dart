// ignore_for_file: file_names

import 'package:ecommerceproject2/controller/allproductsPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/functions/translate_database.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CostumProductsSubCategorie extends GetView<AllProductsControllerImp> {
  const CostumProductsSubCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductsControllerImp>(builder: (controller) {
      return Visibility(
        visible: controller.isvisible,
        child: Container(
          height: 40,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: controller.subSelecteList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: controller.subselecte == index
                      ? AppColor.mainColor
                      : Theme.of(context).primaryColor,
                  border: controller.subselecte == index
                      ? null
                      : Get.isDarkMode
                          ? null
                          : Border.all(color: Colors.black26, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              height: 40,
              child: MaterialButton(
                minWidth: 50,
                onPressed: () {
                  controller.onChangedsub(index);
                },
                child: Text(
                  "${translateDataBase(controller.subSelecteList.elementAt(index), controller.subSelecteListAr.elementAt(index))}",
                  style: TextStyle(
                      fontSize: 17,
                      color: controller.subselecte == index
                          ? Colors.white
                          : Get.isDarkMode
                              ? Colors.white
                              : Colors.black26,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
