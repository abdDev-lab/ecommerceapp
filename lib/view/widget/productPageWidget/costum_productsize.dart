import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_subTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumProductSize extends StatelessWidget {
  const CostumProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CostumSubTitle(title: "size".tr),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: 5,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.changestorage(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(10),
                      color: controller.selectedType == index
                          ? Colors.black
                          : Colors.white),
                  width: 60,
                  child: Text(
                    "${controller.size[index]}",
                    style: TextStyle(
                        color: controller.selectedType == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
