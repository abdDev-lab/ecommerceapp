import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerceproject2/controller/checkout/takeOrderPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumCartDetail extends StatelessWidget {
  const CostumCartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakeOrderPageControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                ...List.generate(
                  controller.datareduce.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " ${"${controller.datareduce[index].cartProductcount} x ${controller.datareduce[index].productName} "}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "${controller.formateToTwoDecimalPlaces(controller.datareduce[index].productpricewithcount!)} \$",
                          style: TextStyle(
                              fontSize: 16,
                              height: 1,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "deliveryprice".tr,
                      style: TextStyle(
                        height: 1.1,
                        fontSize: 15,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "${controller.deliveryPrice} \$",
                      style: TextStyle(
                          height: 1.1,
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
              child: DottedLine(
                direction: Axis.horizontal,
                dashColor: Get.isDarkMode ? Colors.white : Colors.black,
                lineLength: 250,
              ),
            ),
            Visibility(
                visible: controller.coupondiscount == 0 ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "${controller.coupondiscount}% OFF",
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
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
                  "${controller.formateToTwoDecimalPlaces(controller.totalepriceafterdiscount)} \$",
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
