import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumSubTitle extends StatelessWidget {
  final String title;
  final Function()? onpress;
  const CostumSubTitle({
    super.key,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:  TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black, fontSize: 21),
        ),
        InkWell(
          onTap: onpress,
          child:  Text(
            "view".tr,
            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black,),
          ),
        ),
      ],
    );
  }
}
