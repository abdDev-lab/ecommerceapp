import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';
import 'package:flutter/material.dart';

class CostumImageProduct extends StatelessWidget {
  final String imagename ; 
  const CostumImageProduct({super.key, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 350,
      child: CachedNetworkImage(
        imageUrl: "${AppLink.imageslink}/$imagename",
        height: 200,
        width: 100,
      ),
    );
  }
}
