import 'package:ecommerceproject2/controller/onBoardingController.dart';
import 'package:ecommerceproject2/core/localization/localChange.dart';
import 'package:ecommerceproject2/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSlide extends GetView<OnBoardingControllerimp> {
  const OnBoardingSlide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalChange());
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPagechange(value);
      },
      itemCount: onBoardinglist.length,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 20,
          ),
          Image.asset(
            onBoardinglist[index].image,
          ),
          Container(
            height: 10,
          ),
          Text(
            "${onBoardinglist[index].title}".tr,
            style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 20,
          ),
          Text(
            "${onBoardinglist[index].body}".tr,
            style: TextStyle(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
