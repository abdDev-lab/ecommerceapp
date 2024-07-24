import 'package:ecommerceproject2/controller/productPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumBottomBar extends GetView<ProductPageContollerImp> {
  final String price;

  final int id;
  final void Function()? onAdd;
  final void Function()? onFave;
  const CostumBottomBar(
      {super.key,
      required this.price,
      required this.id,
      this.onAdd,
      this.onFave});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Get.isDarkMode? Colors.grey[900]! : AppColor.secColor4,
      height: 110,
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "productprice".tr,
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Get.isDarkMode? Colors.white : Colors.black , 
                      ),
                    ),
                    Visibility(
                      visible: controller.productsModel.productDiscount != 0,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: controller.discountColor[
                                controller.productsModel.productDiscount],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "${controller.productsModel.productDiscount}% OFF",
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "$price\$",
                  style:  TextStyle(
                      fontSize: 24,
                      color: Get.isDarkMode? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () {
                      controller.setOrder();
                      controller.addCart(
                          id.toString(),
                          controller.data["productCount"].toString(),
                          controller.data["productColor"].toString(),
                          controller.data["productSizeOrStorage"].toString());
                    },
                    child: Text(
                      "addtocart".tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GetBuilder<ProductPageContollerImp>(
                  builder: (controller) => Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 231, 231),
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                        minWidth: 50,
                        onPressed: () {
                          controller.favorite(controller.isfavorite);
                        },
                        child: controller.isfavorite == 1
                            ? Icon(
                                UIcons.solidRounded.heart,
                                color: Colors.red,
                              )
                            : Icon(
                                UIcons.regularRounded.heart,
                                color: Colors.black,
                              )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
