import 'package:ecommerceproject2/controller/accountPageController.dart';
import 'package:ecommerceproject2/core/class/handlingdata.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/view/widget/accountPageWidgets/costum_imageAccount.dart';
import 'package:ecommerceproject2/view/widget/accountPageWidgets/costum_textField.dart';
import 'package:ecommerceproject2/view/widget/costumarrowback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountPageControllerImp());
    return GetBuilder<AccountPageControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: HandlingDataRequestforPage(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      CostumeArrowBack(
                        backTopage: AppRoutes.home,
                        iconColor: Get.isDarkMode ? Colors.white : Colors.black,
                        backgroundColor:
                            Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                      const CostumImageAccount(),
                      Form(
                        child: Container(
                          height: 600,
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CostumTextFieldAccount(
                                  readonly: false,
                                  title: "username".tr,
                                  mycontroller: controller.usernameController),
                              CostumTextFieldAccount(
                                  readonly: true,
                                  title: "email".tr,
                                  mycontroller: controller.emailController),
                              Container(
                                height: 250,
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: AppColor.mainColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.updateUserData();
                                    },
                                    child: Text(
                                      "save".tr,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  pageroute: AppRoutes.home),
            ));
  }
}
