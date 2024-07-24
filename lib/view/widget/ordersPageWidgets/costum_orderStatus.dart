import 'package:ecommerceproject2/controller/ordersDetailsPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumOrderStatus extends StatelessWidget {
  const CostumOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersDetailsPageController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
        decoration: BoxDecoration(
          boxShadow: Get.isDarkMode
              ? null
              : [
                  BoxShadow(
                      blurRadius: 8,
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      offset: const Offset(0, 0))
                ],
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                5,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index < controller.ordersModel.ordersStatus!
                            ? SizedBox(
                                width: 300,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.mainColor),
                                      child: Icon(
                                        UIcons.boldRounded.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      controller.orderStatus[index + 1],
                                      style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 300,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 21),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Get.isDarkMode
                                            ? Colors.grey[300]
                                            : Colors.grey[400],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      controller.ordersModel.ordersStatus ==
                                                  0 &&
                                              index == 0
                                          ? controller.orderStatus[0]
                                          : controller.orderStatus[index + 1],
                                      style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.grey[300]
                                            : Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        index != 4
                            ? index < controller.ordersModel.ordersStatus!
                                ? Container(
                                    margin: const EdgeInsets.only(left: 36),
                                    height: 38,
                                    width: 3.5,
                                    color: AppColor.mainColor,
                                  )
                                : Column(
                                    children: [
                                      ...List.generate(3, (index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              top: 5, left: 36),
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Get.isDarkMode
                                                ? Colors.grey[300]
                                                : Colors.grey[400],
                                          ),
                                        );
                                      }),
                                    ],
                                  )
                            : Container()
                      ],
                    )),
                    SizedBox(height: 12,),
            controller.ordersModel.ordersDeliverytype == 0 &&
                    controller.ordersModel.ordersStatus == 4 
                    
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your code : ${controller.ordersModel.ordersDeliverycode}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
