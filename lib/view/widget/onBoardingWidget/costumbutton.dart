import 'package:ecommerceproject2/controller/onBoardingController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/localization/localChange.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumButton extends GetView<LocalChange> {
  const CostumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerimp>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.mainColor,
              ),
              height: 45,
              width: 250,
              child: MaterialButton(
                onPressed: () {
                  controller.next();
                },
                child: Text(
                  controller.textButton,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ));
  }
}
