import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumPaymentType extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isvisible;
  final IconData icon;
  const CostumPaymentType(
      {super.key,
      required this.title,
      this.onTap,
      required this.isvisible,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            boxShadow: Get.isDarkMode
                ? null
                : [
                    BoxShadow(
                        blurRadius: 8,
                        color: const Color.fromARGB(255, 217, 217, 217)
                            .withOpacity(0.5),
                        offset: const Offset(0, 0))
                  ],
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: AppColor.mainColor,
                    //size: 21,
                  ),
                  Container(width: 10),
                  Text(
                    title,
                  ),
                ],
              ),
              Visibility(
                  visible: isvisible,
                  child: Icon(
                    UIcons.regularRounded.check,
                    color: AppColor.mainColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
