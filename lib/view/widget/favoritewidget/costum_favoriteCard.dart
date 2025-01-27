// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/favoriteContoller.dart';
import 'package:ecommerceproject2/controller/favoritePageContoller.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:ecommerceproject2/core/constant/AppRoutes.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumFavoriteCard extends GetView<FavoritePageContollerImp> {
  final ProductsModel productsModel;
  const CostumFavoriteCard({
    super.key,
    required this.productsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.product, arguments: {
          "productDetail": productsModel,
          "currentpage": "/favorite",
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: Get.isDarkMode
                ? null
                : [
                    BoxShadow(
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Hero(
                    tag: "${productsModel.productId}",
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.imageslink}/${productsModel.productImage}",
                      height: 110,
                      width: 200,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${productsModel.productName}",
                          style: TextStyle(
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "${productsModel.productPrice} \$",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1,
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Container(
                          height: 2,
                        ),
                        RatingBar.builder(
                          initialRating: productsModel.productRating!,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.yellow[100],
                          updateOnDrag: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<FavoriteContoller>(
              builder: (favcontroller) => Positioned(
                right: 5,
                top: 1,
                child: InkWell(
                    onTap: () {
                      favcontroller
                          .removeFavorite(productsModel.productId.toString());
                      controller.favoriteproducts = [];
                      controller.getData();
                    },
                    child: Icon(
                      UIcons.regularRounded.cross_circle,
                      size: 23,
                    )),
              ),
            ),
            Positioned(
                left: 3,
                top: 1,
                child: productsModel.productDiscount != 0
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: controller
                                .discountColor[productsModel.productDiscount],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "${productsModel.productDiscount}% OFF",
                          style: const TextStyle(
                            fontSize: 7,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}
