import 'package:ecommerceproject2/controller/ordersDetailsPageController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/widget/ordersPageWidgets/costum_orderReview.dart';
import 'package:ecommerceproject2/view/widget/ordersPageWidgets/costum_orderStatus.dart';
import 'package:ecommerceproject2/view/widget/ordersPageWidgets/costum_orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class OrdersDetailsPage extends StatelessWidget {
  const OrdersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsPageController());
    return Scaffold(
      
      body: ListView(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.home);
                  },
                  icon: Icon(UIcons.regularRounded.angle_left)),
              Container(
                width: 75,
              ),
              Text(
                "ordersdetailstitle".tr,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            ],
          ),
          GetBuilder<OrdersDetailsPageController>(
            builder: (controller) => HandlingData(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    CostumOrderDetails(),
                    CostumOrderReview(),
                    CostumOrderStatus(),
                  ],
                ),
                pageroute: AppRoutes.home),
          )
        ],
      ),
    );
  }
}
