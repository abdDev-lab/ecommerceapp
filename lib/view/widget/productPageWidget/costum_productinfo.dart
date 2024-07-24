import 'package:ecommerceproject2/view/widget/productPageWidget/costum_subTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumProductInfo extends StatelessWidget {
  final String title;
  final double rating;
  final String desc;
  const CostumProductInfo(
      {super.key,
      required this.title,
      required this.rating,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.star_outlined,
              color: Colors.yellow,
            ),
            Container(
              width: 3,
            ),
            Text(
              "$rating",
              style: TextStyle(
                  fontSize: 16,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            Container(
              width: 8,
            ),
            Text(
              "reviews".tr,
              style: TextStyle(
                  fontSize: 16,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
        CostumSubTitle(title: "description".tr),
        Container(
          height: 3,
        ),
        Text(
          desc,
          style: TextStyle(
              fontSize: 14,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ],
    );
  }
}
