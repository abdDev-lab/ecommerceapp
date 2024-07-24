import 'package:ecommerceproject2/controller/cartController.dart';
import 'package:ecommerceproject2/controller/cartProductCountController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/widget/cartPageWidgets/costumCardCart.dart';
import 'package:ecommerceproject2/view/widget/widgetsForAllPages/costum_titlePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    CartProductCountController countController = Get.find();
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: controller.button,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.mainColor,
            ),
            width: 360,
            height: 55,
            child: MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.checkout, arguments: {
                  "cartData": controller.data,
                  "totalePrice": controller.totalPrice
                });
              },
              child:  Text(
                "checkoutbotton".tr,
                style: const TextStyle(color: Colors.white , fontSize: 21 , fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16),
          children: [
            //CostumHeadCart(),
             CostumTitlePage(title: "carttitle".tr),
            HandlingData(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    ...List.generate(controller.data.length, (index) {
                      countController.onproductCart(
                          controller.data[index].cartId!,
                          controller.data[index].cartProductcount!);

                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        key: ValueKey<int>(controller.data[index].cartId!),
                        child:
                            CostumCardCart(cartModel: controller.data[index]),
                        onDismissed: (direction) {
                          controller.removeCart(
                              controller.data[index].productId.toString(),
                              controller.data[index].cartId.toString());
                        },
                      );
                    }),
                    Container(
                      height: 75,
                    ),
                  ],
                ),
                pageroute: AppRoutes.home)
          ],
        )),
      );
    });
  }
}
