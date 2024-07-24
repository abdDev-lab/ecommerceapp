import 'package:ecommerceproject2/controller/checkout/takeOrderPageController.dart';
import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumCouponField extends StatelessWidget {
  const CostumCouponField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakeOrderPageControllerImp>(
      builder: (controller) => Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
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
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: TextField(
                controller: controller.couponController,
                style: const TextStyle(fontSize: 18),
                cursorHeight: 25,
                cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                decoration: InputDecoration(
                    hintText: "promo code ",
                    hintStyle: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 100,
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
                color: AppColor.mainColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: MaterialButton(
              onPressed: () {
                controller.getcouponData();
              },
              child: controller.statusRequest == StatusRequest.loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "apply".tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
