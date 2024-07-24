import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/constant/appasset.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumbuttonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 20,
              ),
              const Text(
                "Success",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Container(
                height: 150,
              ),
              Lottie.asset(AppAsset.checked, repeat: false),
              Container(
                height: 40,
              ),
              const Text(
                "Congratulation,your password\nhas been successfully reseted.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Container(
                height: 250,
              ),
              CostumButtonAuth(
                  buttonTitle: "LOGIN",
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.login);
                  })
            ],
          )
        ],
      )),
    );
  }
}
