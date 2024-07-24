import 'package:dotted_line/dotted_line.dart';

import 'package:ecommerceproject2/controller/ordersDetailsPageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumOrderReview extends StatelessWidget {
  const CostumOrderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersDetailsPageController>(builder: (controller) {
      return Visibility(
        visible: controller.viewall,
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                      title: "",
                      content: Container(
                        padding: const EdgeInsets.only(
                          top: 16,
                          right: 24,
                          left: 24,
                          bottom: 16,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                ...List.generate(
                                  controller.data.length,
                                  (index) => Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " ${"${controller.data[index].cartProductcount} x ${controller.data[index].productName} "}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 18, 18, 18)),
                                        ),
                                        Text(
                                          "${controller.formateToTwoDecimalPlaces(controller.data[index].productpricewithcount!)} \$",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "deliveryprice".tr,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 18, 18, 18)),
                                    ),
                                    Text(
                                      "${controller.ordersModel.ordersDeliveryprice} \$",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const DottedLine(
                              direction: Axis.horizontal,
                              lineLength: 250,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "total".tr,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black87),
                                ),
                                Text(
                                  "${controller.ordersModel.ordersPrice} \$",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "View All",
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
