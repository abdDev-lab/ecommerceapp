import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumeArrowBack extends StatelessWidget {
  final String backTopage;
  final Color iconColor;
  final Color backgroundColor;
  const CostumeArrowBack(
      {super.key,
      required this.backTopage,
      required this.iconColor,
      required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Get.offNamed(backTopage);
            },
            icon: Icon(UIcons.regularRounded.angle_left),
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
