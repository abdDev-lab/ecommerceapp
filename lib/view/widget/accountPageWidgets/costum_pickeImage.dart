// ignore_for_file: file_names

import 'dart:io';

import 'package:ecommerceproject2/controller/accountPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uicons/uicons.dart';

class CostumPickeImage extends StatelessWidget {
  const CostumPickeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountPageControllerImp>(
      builder: (controller) => Container(
        height: 220,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          children: [
            Text(
              "Pick image from : ",
              style: TextStyle(
                fontSize: 20,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        XFile? xFile = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        controller.myfile = File(xFile!.path);
                        if (controller.myfile != null) {
                          Get.back();
                        }

                        controller.updateUserData();
                      },
                      icon: Icon(UIcons.regularStraight.camera),
                      iconSize: 50,
                    ),
                    Text(
                      "camera",
                      style: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        XFile? xFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        controller.myfile = File(xFile!.path);
                        if (controller.myfile != null) {
                          Get.back();
                        }
                        controller.updateUserData();
                      },
                      icon: Icon(UIcons.regularStraight.picture),
                      iconSize: 50,
                    ),
                    Text(
                      "gallery",
                      style: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
