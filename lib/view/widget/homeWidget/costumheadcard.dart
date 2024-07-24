import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/controller/homePageController.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/data/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumHeadCard extends GetView<HomeControllerImp> {
  const CostumHeadCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onpagechange(value);
        },
        itemCount: controller.reducediscountproduct.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.product, arguments: {
              "productDetail": ProductsModel.fromJson(
                  controller.reducediscountproduct[index]),
              "currentpage": AppRoutes.home
            });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 2.5, right: 2.5),
            padding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(controller.setBackground(
                        controller.reducediscountproduct[index]["cat_id"])))),
            height: 160,
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 120,
                      width: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                           Text(
                            "pageviewbody".tr,
                            style: const TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "${controller.reducediscountproduct[index]["product_discount"]}%\nOFF",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              height: 1,
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageslink}/${controller.reducediscountproduct[index]["product_image"]}",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
