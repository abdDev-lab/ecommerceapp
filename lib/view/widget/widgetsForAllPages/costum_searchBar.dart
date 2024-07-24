// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumSearchBar extends StatelessWidget {
  final TextEditingController mycontroler;
  final bool cancelvisible;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onCancel;

  const CostumSearchBar({
    super.key,
    required this.mycontroler,
    this.onChanged,
    this.onSubmitted,
    this.onCancel,
    required this.cancelvisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: mycontroler,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  style: const TextStyle(fontSize: 16),
                  cursorColor: Get.isDarkMode ? Colors.grey[500] : Colors.black,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 16, color: Colors.grey[500]),
                      hintText: "search".tr,
                      filled: true,
                      fillColor: Get.isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey[200],
                      prefixIcon: Icon(
                        UIcons.regularRounded.search,
                        size: 20,
                      ),
                      suffixIcon: Visibility(
                        visible: cancelvisible,
                        child: IconButton(
                            onPressed: onCancel,
                            color: Colors.grey[500],
                            icon: Icon(UIcons.regularRounded.cross_small)),
                      ),
                      prefixIconColor: Colors.grey[500],
                      focusColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
