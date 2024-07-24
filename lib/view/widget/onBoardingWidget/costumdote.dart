import 'package:ecommerceproject2/controller/onBoardingController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumeDote extends StatelessWidget {
  const CostumeDote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerimp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardinglist.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.currentpage == index ? AppColor.mainColor : AppColor.secColor2,
                          ),
                        ))
              ],
            ));
  }
}
