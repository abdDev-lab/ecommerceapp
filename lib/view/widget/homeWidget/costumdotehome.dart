import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumeDoteHome extends StatelessWidget {
  const CostumeDoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    3,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: controller.currentpage == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.currentpage == index
                                ? AppColor.mainColor
                                : AppColor.secColor2,
                          ),
                        ))
              ],
            ));
    
  }
}
