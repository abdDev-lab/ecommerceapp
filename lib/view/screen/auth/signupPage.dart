// ignore_for_file: file_names

import 'package:ecommerceproject2/controller/auth/signUpController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';

import 'package:ecommerceproject2/core/constant/appRoutes.dart';

import 'package:ecommerceproject2/core/functions/validinput.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumText.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumbuttonAuth.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtextfield.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtitle.dart';
import 'package:ecommerceproject2/view/widget/costumarrowback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<SignupControllerImp>(
              builder: (controller) => HandlingDataRequestforPage(
                    pageroute: AppRoutes.login,
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Form(
                          key: controller.formstate,
                          child: Column(
                            children: [
                              const CostumeArrowBack(
                                  iconColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  backTopage: AppRoutes.login),
                              const CostumTitleAuth(
                                  title: "Lets Get Started!",
                                  body:
                                      "Create an account to get all amazing features of this app"),
                              Container(
                                height: 20,
                              ),
                              CostumeTextField(
                                isNumber: false,
                                validator: (val) {
                                  return valideInput(val!, 6, 30, "username");
                                },
                                hinttext: "Username",
                                iconData: UIcons.regularRounded.user,
                                controller: controller.username,
                              ),
                              Container(
                                height: 5,
                              ),
                              CostumeTextField(
                                isNumber: false,
                                validator: (val) {
                                  return valideInput(val!, 10, 50, "email");
                                },
                                hinttext: "Email",
                                iconData: UIcons.regularRounded.at,
                                controller: controller.email,
                              ),
                              Container(
                                height: 5,
                              ),
                              CostumeTextField(
                                isNumber: true,
                                validator: (val) {
                                  return valideInput(val!, 8, 15, "phone");
                                },
                                hinttext: "Phone",
                                iconData: UIcons.regularRounded.smartphone,
                                controller: controller.phonenumber,
                              ),
                              Container(
                                height: 5,
                              ),
                              GetBuilder<SignupControllerImp>(
                                builder: (controller) => CostumeTextField(
                                  obscureText: controller.isvisible1,
                                  isNumber: false,
                                  onIcon: () {
                                    controller.isVisiblePass();
                                  },
                                  validator: (val) {
                                    return valideInput(val!, 8, 50, "password");
                                  },
                                  hinttext: "password".tr,
                                  iconData: controller.lockicon1,
                                  controller: controller.password,
                                ),
                              ),
                              Container(
                                height: 5,
                              ),
                              GetBuilder<SignupControllerImp>(
                                builder: (controller) => CostumeTextField(
                                  obscureText: controller.isvisible2,
                                  isNumber: false,
                                  onIcon: () {
                                    controller.isVisibleConfpass();
                                  },
                                  validator: (val) {
                                    return confirmpassword(
                                        controller.password.text, val!);
                                  },
                                  hinttext: "confirmpassword".tr,
                                  iconData: controller.lockicon2,
                                  controller: controller.confirmpassword,
                                ),
                              ),
                              Container(
                                height: 50,
                              ),
                              CostumButtonAuth(
                                buttonTitle: "CREATE",
                                onPressed: () {
                                  controller.signup();
                                },
                              ),
                              Container(
                                height: 40,
                              ),
                              CostumText(
                                text: "Already have an account?",
                                namepage: "Login here",
                                onPressed: () {
                                  Get.offAllNamed(AppRoutes.login);
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
