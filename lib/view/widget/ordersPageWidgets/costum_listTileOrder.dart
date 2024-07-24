import 'package:ecommerceproject2/core/constant/appColor.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uicons/uicons.dart';

class CostumListTileOrder extends StatelessWidget {
  final int orderStatus;
  final int orderid;
  final double orderprice;
  final String paymentMethod;
  final String deliveryType;
  final String image;
  final void Function()? onTapOrderDetail;
  final void Function()? onTapDeleteOrder;
  const CostumListTileOrder(
      {super.key,
      required this.orderid,
      required this.orderprice,
      required this.paymentMethod,
      required this.deliveryType,
      required this.image,
      required this.orderStatus,
      this.onTapOrderDetail,
      this.onTapDeleteOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(5),
      height: 135,
      decoration: BoxDecoration(
        boxShadow: Get.isDarkMode ? null :  [
          BoxShadow(
              blurRadius: 8,
              color: const Color.fromARGB(255, 217, 217, 217).withOpacity(0.5),
              offset: const Offset(0, 0))
        ],
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              image,
              width: 90,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID $orderid"),
                    Row(
                      children: [
                        Text(
                          "price".tr,
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Text("$orderprice\$",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "paymentmethod".tr,
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Text(paymentMethod,
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                height: 1)),
                      ],
                    ),
                    Text(deliveryType,
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            height: 1.4)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: orderStatus < 2,
                      child: InkWell(
                        onTap: onTapDeleteOrder,
                        child: Row(
                          children: [
                            Text(
                              "cancelorder".tr,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onTapOrderDetail,
                      child: Row(
                        children: [
                          Text(
                            "orderdetails".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.mainColor),
                          ),
                          Icon(
                            UIcons.regularStraight.angle_right,
                            size: 16,
                            color: AppColor.mainColor,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
