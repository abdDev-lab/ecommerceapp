import 'package:ecommerceproject2/controller/auth/forgetPassword/forgetPasswordController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';

import 'package:ecommerceproject2/core/constant/appRoutes.dart';

import 'package:ecommerceproject2/core/functions/validinput.dart';

import 'package:ecommerceproject2/view/widget/authPageWidget/costumbuttonAuth.dart';

import 'package:ecommerceproject2/view/widget/authPageWidget/costumtextfield.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtitle.dart';
import 'package:ecommerceproject2/view/widget/costumarrowback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<ForgetPasswordControllerImp>(
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
                                title: "Forget Password",
                                body: "Enter your email address",
                              ),
                              Container(
                                height: 100,
                              ),
                              CostumeTextField(
                                isNumber: false,
                                validator: (val) {
                                  return valideInput(val!, 10, 50, "email");
                                },
                                hinttext: "Email ",
                                iconData: Icons.email_outlined,
                                controller: controller.email,
                              ),
                              Container(
                                height: 50,
                              ),
                              CostumButtonAuth(
                                buttonTitle: "SEND",
                                onPressed: () {
                                  controller.checkemail();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
