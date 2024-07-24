import 'package:ecommerceproject2/controller/auth/forgetPassword/verifyCodeController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<VerifyCodeControllerImp>(
              builder: (controller) => HandlingDataRequestforPage(
                    pageroute: AppRoutes.login,
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            const CostumTitleAuth(
                              title: "Verification Code",
                              body:
                                  "Please entre the code that send\n to your email address.",
                            ),
                            Container(
                              height: 100,
                            ),
                            OtpTextField(
                              textStyle: const TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              numberOfFields: 5,
                              borderColor: AppColor.mainColor,
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onSubmit: (String verificationCode) {
                                 
                                controller.checkCode(verificationCode);
                                verificationCode = "" ; 
                              }, // end onSubmit
                            ),
                            Container(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                controller.resendCode();
                              },
                              child: Text(
                                "Resend Code",
                                style: TextStyle(color: AppColor.mainColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))),
    );
  }
}
