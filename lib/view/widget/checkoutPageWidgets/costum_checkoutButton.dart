import 'package:ecommerceproject2/controller/checkout/checkoutPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumCheckoutButton extends StatelessWidget {
  const CostumCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutPageControllerImp>(
      builder: (controller) => Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.mainColor,
          ),
          width: 360,
          height: 55,
          child: MaterialButton(
            onPressed: () {
              if (controller.currentpage < 5) {
                controller.paymentpageimp();
              }
              if (controller.currentpage == 5) {
                controller.orderscheckout();
                controller.showbackbotton();
              }
              if (controller.currentpage == 10) {
                Get.offAllNamed(AppRoutes.home);
              }
            },
            child: Text(
              controller.buttonName[controller.indexbuttonName],
              style: const TextStyle(color: Colors.white , fontSize: 21 , fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
