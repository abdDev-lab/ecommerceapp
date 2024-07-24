import 'package:ecommerceproject2/controller/checkout/paymentPageController.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_creditCard.dart';

import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_creditCardDetail.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_listTile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: GetBuilder<PaymentPageControllerImp>(
          builder: (controller) => Column(
            children: [
              CostumPaymentType(
                  onTap: () {
                    controller.onPressCach();
                  },
                  title: "cach".tr,
                  isvisible: controller.cashSelected == true ? true : false,
                  icon: UIcons.solidStraight.money),
              const SizedBox(
                height: 16,
              ),
              CostumPaymentType(
                title: "creditcard".tr,
                isvisible: controller.creditSelected == true ? true : false,
                icon: UIcons.solidStraight.credit_card,
                onTap: () {
                  //controller.onPressCredit();
                  if (controller.creditSelected == false) {
                    Get.bottomSheet(
                      const CostumCreditCardDetails(),
                      isScrollControlled: true,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Visibility(
                visible: controller.cardvisible,
                child: const CreditCard(),
              ),
            ],
          ),
        ));
  }
}
