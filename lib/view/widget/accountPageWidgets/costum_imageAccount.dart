// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/accountPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumImageAccount extends StatelessWidget {
  const CostumImageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountPageControllerImp>(
      builder: (controller) => Container(
        color: Get.isDarkMode? Colors.black : Colors.white ,
        height: 170,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: Hero(
                tag: "accountimg",
                child: CircleAvatar(
                    backgroundColor: Get.isDarkMode ? Colors.black : Colors.white ,
                    radius: 55,
                    backgroundImage: CachedNetworkImageProvider(
                      "${AppLink.userimageslink}/${controller.userimage}",
                    )),
              ),
            ),
          ),
          Positioned(
            left: 220,
            top: 75,
            child: Container(
              padding: const EdgeInsets.all(0),
              width: 32,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.mainColor),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  controller.pickImage();
                },
                icon: Icon(UIcons.regularRounded.picture),
                iconSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
