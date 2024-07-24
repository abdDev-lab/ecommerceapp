import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumHeadProducts extends StatelessWidget {
  final String image;
  final void Function()? onPressedNotify;
  final void Function()? onPressedback;
  final void Function()? onPressedaccount;

  const CostumHeadProducts({
    super.key,
    required this.image,
    this.onPressedNotify,
    this.onPressedaccount,
    this.onPressedback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPressedback,
            icon: Icon(UIcons.regularRounded.angle_left),
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onPressedback,
                  icon: Icon(UIcons.regularRounded.bell)),
              Container(
                width: 5,
              ),
              InkWell(
                onTap: onPressedaccount,
                child: Hero(
                    tag: "accountimg",
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                          "${AppLink.userimageslink}/$image",
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }
}
