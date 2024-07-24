import 'package:ecommerceproject2/controller/onBoardingController.dart';
import 'package:ecommerceproject2/core/localization/localChange.dart';
import 'package:ecommerceproject2/view/widget/onBoardingWidget/costumbutton.dart';
import 'package:ecommerceproject2/view/widget/onBoardingWidget/costumdote.dart';
import 'package:ecommerceproject2/view/widget/onBoardingWidget/onboardingslide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends GetView<LocalChange> {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerimp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            const Expanded(flex: 4, child: OnBoardingSlide()),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const CostumeDote(),
                    Container(
                      height: 40,
                    ),
                    const CostumButton(),
                  ],
                ))
          ],
        )));
  }
}
