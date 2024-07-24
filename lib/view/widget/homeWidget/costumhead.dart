import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';

import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumHeadHome extends StatelessWidget {
  const CostumHeadHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "hometitle".tr,
                style:  TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black, fontSize: 26),
              ),
            ),
            Visibility(
              visible: controller.gifticon,
              child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 10,
                      contentPadding:
                          const EdgeInsets.only(left: 16, right: 16),
                      title: "",
                      titleStyle:
                          const TextStyle(color: Colors.white, fontSize: 2),
                      content: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  iconSize: 20,
                                  icon: Icon(
                                    UIcons.regularRounded.cross,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 24),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.secColor4,
                                  ),
                                  child: Icon(
                                    UIcons.regularRounded.gift,
                                    color: AppColor.mainColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "couponbody".tr,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "${controller.giftcoupondiscount}% OFF",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Montserate",
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "couponsubbody".tr,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller.giftcouponname!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(10),
                                    height: 50,
                                    color: AppColor.mainColor,
                                    child: MaterialButton(
                                      onPressed: () {
                                        controller.redeemCode();
                                      },
                                      child: Text(
                                        "redeemcoupon".tr,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ));
                },
                icon: Icon(UIcons.solidStraight.gift),
                iconSize: 25,
                color: Colors.red,
              ),
            ),

            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notifications);
              },
              icon: Icon(UIcons.regularRounded.bell),
              iconSize: 25,
            ),
            //Container(
            //  width: 50,
            //  height: 40,
            //  child: Stack(children: [
            //    Center(
            //      child: Icon(UIcons.regularRounded.bell),
            //    ),
            //    Visibility(
            //        visible:receive ,
            //        child: Positioned(
            //            top: 12,
            //            left: 27,
            //            child: Container(
            //              height: 8,
            //              width: 8,
            //              decoration: BoxDecoration(
            //                  shape: BoxShape.circle, color: AppColor.mainColor),
            //            )))
            //  ]),
            //),

            Container(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.account, arguments: {
                  "username": controller.myServices.sharedPreferences
                      .getString("username")!,
                  "email": controller.myServices.sharedPreferences
                      .getString("email")!,
                  "image": controller.myServices.sharedPreferences
                      .getString("image")!
                });
              },
              child: Hero(
                  tag: "accountimg",
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(
                        "${AppLink.userimageslink}/${controller.myServices.sharedPreferences.getString("image")}",
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
