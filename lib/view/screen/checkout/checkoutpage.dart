import 'package:ecommerceproject2/controller/checkout/checkoutPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/screen/checkout/takeorderpage.dart';
import 'package:ecommerceproject2/view/screen/checkout/paymentpage.dart';
import 'package:ecommerceproject2/view/screen/checkout/successCheckoutpage.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_checkoutButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutPageControllerImp());
    return Scaffold(
      body: GetBuilder<CheckOutPageControllerImp>(
        builder: (controller) => ListView(
          children: [
            controller.backbotton
                ? SizedBox(
                  height: 40,
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: controller.backbotton,
                          child: IconButton(
                            onPressed: () {
                              Get.offNamed(AppRoutes.home);
                            },
                            icon: Icon(UIcons.regularRounded.angle_left),
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Container(
                          width: controller.myServices.sharedPreferences
                                      .getString("lang") ==
                                  "ar"
                              ? 120
                              : 88,
                        ),
                        Text(
                          "checkoutitle".tr,
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                )
                : SizedBox(
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "checkoutitle".tr,
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(UIcons.regularStraight.marker),
                  Icon(
                    UIcons.solidStraight.marker,
                    color: controller.currentpage == 0
                        ? AppColor.mainColor
                        : Colors.grey,
                    size: 21,
                  ),
                  ...List.generate(4, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentpage == index + 1
                            ? AppColor.mainColor
                            : Colors.grey,
                      ),
                    );
                  }),
                  Icon(
                    //UIcons.regularStraight.credit_card,
                    UIcons.solidStraight.credit_card,
                    color: controller.currentpage == 5
                        ? AppColor.mainColor
                        : Colors.grey,
                    size: 22,
                  ),
                  ...List.generate(4, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentpage == index + 6
                            ? AppColor.mainColor
                            : Colors.grey,
                      ),
                    );
                  }),
                  Icon(
                    UIcons.regularStraight.check,
                    color: controller.currentpage == 10
                        ? AppColor.mainColor
                        : Colors.grey,
                    size: 22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  TakeOrderPage(),
                  PaymentPage(),
                  SuccessChackoutPage(),
                ],
              ),
            ),
            const CostumCheckoutButton(),
          ],
        ),
      ),
    );
  }
}
