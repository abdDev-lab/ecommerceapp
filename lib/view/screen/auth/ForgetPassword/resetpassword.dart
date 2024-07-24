import 'package:ecommerceproject2/controller/auth/forgetPassword/resetPasswordController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';

import 'package:ecommerceproject2/core/functions/validinput.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumText.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumbuttonAuth.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtextfield.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<ResetPasswordControllerImp>(
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
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: MaterialButton(
                                      padding: const EdgeInsets.only(right: 20),
                                      onPressed: () {
                                        Get.offAllNamed(
                                            AppRoutes.forgetpassword);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        size: 35,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const CostumTitleAuth(
                                title: "Reset Password",
                                body: "Please entre new password",
                              ),
                              Container(
                                height: 50,
                              ),
                              GetBuilder<ResetPasswordControllerImp>(
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
                              GetBuilder<ResetPasswordControllerImp>(
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
                                buttonTitle: "SAVE",
                                onPressed: () {
                                  controller.resetPassword();
                                },
                              ),
                              Container(
                                height: 405,
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
