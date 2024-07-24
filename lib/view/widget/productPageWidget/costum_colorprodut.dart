import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_subTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumColorProduct extends StatelessWidget {
  const CostumColorProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CostumSubTitle(title: "color".tr),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                ...List.generate(
                    3,
                    (index) => InkWell(
                          onTap: () {
                            controller.changecolor(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.colors[index]["color"],
                                border:
                                    controller.colors[controller.selectedColor]
                                                ["name"] ==
                                            "black" && index == 0
                                        ? Border.all(color: Colors.white)
                                        : null),
                            child: controller.selectedColor == index
                                ? Icon(
                                    UIcons.regularRounded.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
