import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/view/widget/locationWidgets/locationpage.dart';
import 'package:ecommerceproject2/view/widget/locationWidgets/locationPermission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumConfirmLocation extends StatelessWidget {
  const CostumConfirmLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        determinePosition();
        Get.to(() => const CostumMapFlutter(),
            transition: Transition.circularReveal);
      },
      child: Container(
        height: 60,
        //margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(boxShadow: Get.isDarkMode ?null : [
          BoxShadow(
              blurRadius: 8,
              color: const Color.fromARGB(255, 217, 217, 217).withOpacity(0.5),
              offset: const Offset(0, 0))
        ], color: Theme.of(context).primaryColor   , borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                UIcons.solidStraight.marker,
                color: AppColor.mainColor,
                //size: 21,
              ),
              Container(width: 10),
              Text(
                "confirmlocation".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
