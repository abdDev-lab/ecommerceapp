import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerceproject2/controller/ordersDetailsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumOrderDetails extends StatelessWidget {
  const CostumOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersDetailsPageController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        padding: const EdgeInsets.all(10),
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
          children: [
            Column(
              children: [
                Center(
                  child: Text("ID ${controller.ordersModel.ordersId}"),
                ),
                Column(
                  children: [
                    ...List.generate(
                      controller.datareduce.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " ${"${controller.data[index].cartProductcount} x ${controller.data[index].productName} "}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              "${controller.formateToTwoDecimalPlaces(controller.datareduce[index].productpricewithcount!)}\$",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "deliveryprice".tr,
                      style: TextStyle(
                        fontSize: 15,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "${controller.ordersModel.ordersDeliveryprice}\$",
                      style: TextStyle(
                          fontSize: 16,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const DottedLine(
                direction: Axis.horizontal,
                lineLength: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "total".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  "${controller.ordersModel.ordersPrice}\$",
                  style: TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
