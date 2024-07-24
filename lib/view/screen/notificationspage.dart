import 'package:ecommerceproject2/controller/notificationsPageController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';

import 'package:ecommerceproject2/core/constant/appRoutes.dart';

import 'package:ecommerceproject2/view/widget/notificationsPageWidgets/costum_notificationListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsPageController());
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.home);
                  },
                  icon: Icon(UIcons.regularRounded.angle_left)),
              GetBuilder<NotificationsPageController>(
                builder: (controller) => Container(
                  width: controller.myServices.sharedPreferences
                              .getString("lang") ==
                          "ar"
                      ? 100
                      : 76,
                ),
              ),
              Text(
                "notifications".tr,
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 24),
              ),
            ],
          ),
          GetBuilder<NotificationsPageController>(
              builder: (controller) => HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      ...List.generate(
                          controller.data.length,
                          (index) => CostumNotificationsListTile(
                                message:
                                    controller.data[index].notificationsBody!,
                                isread:
                                    controller.data[index].notificationsRead ==
                                            0
                                        ? false
                                        : true,
                                notificationdate: controller
                                    .data[index].notificationsDatetime!,
                              ))
                    ],
                  ),
                  pageroute: AppRoutes.notifications))
        ],
      )),
    );
  }
}
