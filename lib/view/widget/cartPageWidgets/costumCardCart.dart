// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/cartController.dart';
import 'package:ecommerceproject2/controller/cartProductCountController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:ecommerceproject2/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uicons/uicons.dart';

class CostumCardCart extends StatelessWidget {
  final CartModel cartModel;

  const CostumCardCart({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    CartProductCountController countController = Get.find();
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
            boxShadow: Get.isDarkMode
                ? null
                : [
                    BoxShadow(
                        blurRadius: 8,
                        color: const Color.fromARGB(255, 217, 217, 217)
                            .withOpacity(0.5),
                        offset: const Offset(0, 0))
                  ]),
        height: 135,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 110,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageslink}/${cartModel.productImage}",
                )),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 190,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${cartModel.productName}",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartModel.cartProductcolor == "null"
                              ? ""
                              : "${cartModel.cartProductcolor}",
                          style: TextStyle(
                              fontSize: 14,
                              height: 1,
                              color: Get.isDarkMode
                                  ? Colors.grey[400]
                                  : Colors.grey[600]),
                        ),
                        Text(
                          cartModel.cartProductsizeorstorage == "null"
                              ? ""
                              : "${cartModel.cartProductsizeorstorage}",
                          style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Get.isDarkMode
                                  ? Colors.grey[400]
                                  : Colors.grey[600]),
                        ),
                        cartModel.sex == "M"
                            ? Icon(
                                UIcons.regularRounded.mars,
                                size: 16,
                                color: Colors.blueAccent,
                              )
                            : cartModel.sex == "F"
                                ? Icon(
                                    UIcons.regularRounded.venus,
                                    size: 16,
                                    color: Colors.pinkAccent,
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${controller.formateToTwoDecimalPlaces(cartModel.productpricewithdiscount!)}\$",
                        style: TextStyle(
                            fontSize: 17,
                            height: 1.1,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        "${cartModel.productPrice}\$",
                        style: TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          decoration: TextDecoration.lineThrough,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 94,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            color: AppColor.mainColor),
                        child: IconButton(
                          onPressed: () {
                            countController.addproductcount(cartModel.cartId!);
                            controller.updatecountproductCart(
                                cartModel.cartId.toString(),
                                countController.productsCount[cartModel.cartId]
                                    .toString());
                          },
                          icon: Icon(
                            UIcons.boldRounded.plus,
                          ),
                          iconSize: 15,
                          color: Colors.white,
                        )),
                  ),
                  GetBuilder<CartProductCountController>(
                    builder: (countcontroller) => Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${countcontroller.productsCount[cartModel.cartId]}",
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6)),
                          border:
                              Border.all(width: 2, color: AppColor.mainColor)),
                      child: IconButton(
                        onPressed: () {
                          if (countController.productsCount[cartModel.cartId] >=
                              2) {
                            countController
                                .minusproductcount(cartModel.cartId!);
                            controller.updatecountproductCart(
                                cartModel.cartId.toString(),
                                countController.productsCount[cartModel.cartId]
                                    .toString());
                          }
                        },
                        icon: Icon(
                          UIcons.boldRounded.minus,
                        ),
                        iconSize: 12,
                        color: AppColor.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
