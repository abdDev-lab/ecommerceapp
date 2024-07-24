import 'package:ecommerceproject2/controller/auth/signUpVerifyController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/view/widget/authPageWidget/costumtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignUpVerification extends StatelessWidget {
  const SignUpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<SignUpVerifyCodeControllerImp>(
        builder: (controller) => ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
                  height: 20,
                ),
                const CostumTitleAuth(
                  title: "Verification Code",
                  body:
                      "Please entre the code that send\n to your email address.",
                ),
                Container(
                  height: 50,
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
      )),
    );
  }
}
