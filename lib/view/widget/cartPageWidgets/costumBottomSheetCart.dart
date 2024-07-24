// ignore_for_file: file_names

import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerceproject2/controller/cartController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumBottumSheetCart extends GetView<CartController> {
  const CostumBottumSheetCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
        right: 24,
        left: 24,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Container(
          //  margin: EdgeInsets.only(bottom: 16),
          //  height: 5,
          //  width: 100,
          //  decoration: BoxDecoration(
          //    color: Colors.black,
          //    borderRadius: BorderRadius.circular(10)
          //  ),
          //),
          Column(
            children: [
              ...List.generate(
                  controller.data.length,
                  (index) => Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              " ${"${controller.data[index].cartProductcount} x ${controller.data[index].productName} "}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 18, 18, 18)),
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
                      ))
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
              const Text(
                "TOTALE : ",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              Text(
                "${controller.totalPrice} \$",
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.mainColor,
            ),
            width: 360,
            height: 55,
            child: MaterialButton(
              onPressed: () {
              
              },
              child: const Text(
                "PAY NOW",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
