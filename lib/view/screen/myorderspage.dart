import 'package:ecommerceproject2/controller/ordersPageController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';

import 'package:ecommerceproject2/view/widget/ordersPageWidgets/costum_listTileOrder.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_titlePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPageControllerImp());
    return GetBuilder<OrdersPageControllerImp>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              CostumTitlePage(title: "orderstitle".tr),
              HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.data.length,
                            (index) => CostumListTileOrder(
                                onTapOrderDetail: () {
                                  controller
                                      .gotoDetails(controller.data[index]);
                                },
                                onTapDeleteOrder: () {
                                  controller.deleteorder(controller
                                      .data[index].ordersId
                                      .toString());
                                },
                                orderStatus:
                                    controller.data[index].ordersStatus!,
                                image: controller.orderstatusimage(
                                    controller.data[index].ordersStatus!,
                                    controller.data[index].ordersDeliverytype!),
                                orderid: controller.data[index].ordersId!,
                                orderprice: controller.data[index].ordersPrice!,
                                paymentMethod: controller
                                            .data[index].ordersPaymentmethod ==
                                        0
                                    ? "cach".tr
                                    : "creditcard".tr,
                                deliveryType:
                                    controller.data[index].ordersDeliverytype ==
                                            0
                                        ? "orderstatus3".tr
                                        : "pickup".tr))
                      ],
                    ),
                  ),
                  pageroute: AppRoutes.home)
            ],
          ),
        ),
      ),
    );
  }
}
