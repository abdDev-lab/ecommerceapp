import 'package:ecommerceproject2/controller/checkout/takeOrderPageController.dart';

import 'package:ecommerceproject2/core/constant/appasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumDeliveryType extends StatelessWidget {
  const CostumDeliveryType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakeOrderPageControllerImp>(
      builder: (controller) => Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                controller.deliveryPress();
              },
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  blurRadius: 8,
                                  color:
                                      const Color.fromARGB(255, 217, 217, 217)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 0))
                            ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: controller.deliverySelected
                          ? Border.all(
                              color: Get.isDarkMode
                                  ? Colors.white70
                                  : Colors.black87,
                              width: 2)
                          : null),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Image.asset(
                        AppAsset.deliveryorder,
                        width: 300,
                      )),
                      Text(
                        "delivery".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  )),
            ),
          ),
          Container(
            width: 8,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.officePress();
              },
              child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  blurRadius: 8,
                                  color:
                                      const Color.fromARGB(255, 217, 217, 217)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 0))
                            ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: controller.officeSelected
                          ? Border.all(
                              color: Get.isDarkMode
                                  ? Colors.white70
                                  : Colors.black87,
                              width: 2)
                          : null),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppAsset.pickuporder,
                          width:250,
                        ),
                      ),
                      Text(
                        "pickup".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
