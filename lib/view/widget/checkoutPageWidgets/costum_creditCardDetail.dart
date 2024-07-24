import 'package:ecommerceproject2/controller/checkout/paymentPageController.dart';
import 'package:ecommerceproject2/core/constant/appColor.dart';
import 'package:ecommerceproject2/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumCreditCardDetails extends StatelessWidget {
  const CostumCreditCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentPageControllerImp>(
      builder: (controller) => Container(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
        height: controller.bottomSheetHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Form(
          key: controller.formstate,
          child: Column(
            children: [
              Text(
                "credittitle".tr,
                style: TextStyle(
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                height: controller.textFieldHeight,
                child: TextFormField(
                  controller: controller.nameController,
                  validator: (value) {
                    return cardInputValid(value!, "name");
                  },
                  cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: "cardname".tr,
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Icon(
                        UIcons.regularStraight.user,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      iconColor: Get.isDarkMode ? Colors.white : Colors.black,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: controller.textFieldHeight,
                child: TextFormField(
                  validator: (value) {
                    return cardInputValid(value!, "cardnumber");
                  },
                  controller: controller.cardNumberController,
                  onChanged: (value) {},
                  maxLength: 19,
                  cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintText: "cardnumber".tr,
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Icon(
                        controller.isvisaCard
                            ? UIcons.brands.visa
                            : UIcons.solidStraight.credit_card,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      focusColor: Get.isDarkMode ? Colors.white : Colors.black,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: controller.textFieldHeight,
                      child: TextFormField(
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 18),
                        controller: controller.dateController,
                        onChanged: (value) {},
                        validator: (value) {
                          return cardInputValid(value!, "date");
                        },
                        maxLength: 5,
                        cursorColor:
                            Get.isDarkMode ? Colors.white : Colors.black,
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: "MM/YY",
                            hintStyle:
                                const TextStyle(color: Colors.grey, fontSize: 18),
                            focusColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: controller.textFieldHeight,
                      child: TextFormField(
                        controller: controller.cvvController,
                        validator: (value) {
                          return cardInputValid(value!, "cvv");
                        },
                        maxLength: 3,
                        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                        keyboardType: TextInputType.number,
                        style:
                             TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black, fontSize: 18),
                        decoration:  InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: "CVV",
                            hintStyle:
                                const TextStyle(color: Colors.grey, fontSize: 18),
                            border: const OutlineInputBorder(),
                            focusColor: Get.isDarkMode ? Colors.white : Colors.black,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 350,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.mainColor,
                ),
                child: MaterialButton(
                  onPressed: () {
                    controller.onSubmit();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white , fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
