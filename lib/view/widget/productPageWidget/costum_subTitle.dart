// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumSubTitle extends StatelessWidget {
  final String title;
  const CostumSubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}
