import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumQuantite extends StatelessWidget {
  const CostumQuantite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                controller.minusquantite();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: AppColor.mainColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Icon(
                  UIcons.regularRounded.minus_small,
                  size: 35,
                  color: AppColor.mainColor,
                ),
              ),
            ),
            Text(
              "${controller.productQ}",
              style:  TextStyle(fontSize: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            InkWell(
              onTap: () {
                controller.addquantite();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.mainColor),
                child: Icon(
                  UIcons.regularRounded.plus_small,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
