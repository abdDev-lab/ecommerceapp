import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/view/widget/productPageWidget/costum_subTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumProductStorage extends StatelessWidget {
  const CostumProductStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPageContollerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CostumSubTitle(title: "storage".tr),
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
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 12, left: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: controller.selectedType == index
                          ? AppColor.mainColor
                          : const Color.fromARGB(255, 232, 231, 231)),
                  width: 115,
                  child: Text(
                    "${controller.storages[index]}",
                    style: TextStyle(
                        color: controller.selectedType == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
