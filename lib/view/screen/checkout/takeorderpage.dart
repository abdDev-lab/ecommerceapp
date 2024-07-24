import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_cartDetail.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_confirmLocation.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_couponField.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_deliveryType.dart';
import 'package:ecommerceproject2/view/widget/checkoutPageWidgets/costum_reviewCart.dart';
import 'package:flutter/material.dart';

class TakeOrderPage extends StatelessWidget {
  const TakeOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const CostumCartDetail(),
          const CostumReviewCart(),
          const CostumCouponField(),
          Container(
            height: 24,
          ),
          const CostumDeliveryType(),
          Container(
            height: 24,
          ),
          const CostumConfirmLocation(),
        ],
      ),
    );
  }
}
