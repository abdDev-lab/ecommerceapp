import 'package:ecommerceproject2/controller/checkout/paymentPageController.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentPageControllerImp>(builder: (controller) {
      return FlipCard(
          flipOnTouch: true,
          side: CardSide.FRONT,
          direction: FlipDirection.HORIZONTAL,
          front: SizedBox(
              child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  blurRadius: 8,
                                  color:
                                      const Color.fromARGB(255, 217, 217, 217)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 0))
                            ],
                      borderRadius: BorderRadius.circular(10)),
                  height: 240,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("asset/images/7010262_3519449.jpg"),
                  )),
              Positioned(
                  left: 18,
                  top: 10,
                  child: Icon(
                    controller.isvisaCard
                        ? UIcons.brands.visa
                        : UIcons.solidStraight.credit_card,
                    color: Colors.white,
                    size: 55,
                  )),
              const Positioned(
                  right: 16,
                  bottom: 15,
                  child: Icon(
                    Icons.flip_to_front_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
              Positioned(
                top: 100,
                left: 20,
                child: Text(
                  controller.iscardnumbervisible
                      ? controller.cardNumberController.text
                      : controller
                          .hideCardNumber(controller.cardNumberController.text),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Positioned(
                  right: 16,
                  top: 105,
                  child: InkWell(
                    onTap: () {
                      controller.onPressShowCardNumber();
                    },
                    child: Icon(
                      controller.iscardnumbervisible
                          ? UIcons.regularRounded.eye
                          : UIcons.regularRounded.eye_crossed,
                      color: Colors.white,
                      size: 28,
                    ),
                  )),
              Positioned(
                  left: 21,
                  bottom: 30,
                  child: Text(
                    controller.dateController.text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ],
          )),
          back: SizedBox(
              child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      boxShadow: Get.isDarkMode
                          ? null
                          : [
                              BoxShadow(
                                  blurRadius: 8,
                                  color:
                                      const Color.fromARGB(255, 217, 217, 217)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 0))
                            ],
                      borderRadius: BorderRadius.circular(10)),
                  height: 240,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("asset/images/7010262_3519449.jpg"),
                  )),
              Positioned(
                  left: 18,
                  top: 10,
                  child: Icon(
                    controller.isvisaCard
                        ? UIcons.brands.visa
                        : UIcons.solidStraight.credit_card,
                    color: Colors.white,
                    size: 55,
                  )),
              const Positioned(
                  right: 16,
                  top: 15,
                  child: Icon(
                    Icons.flip_to_back_rounded,
                    color: Colors.white,
                    size: 30,
                  )),
              Positioned(
                  left: 21,
                  bottom: 30,
                  child: Text(
                    controller.nameController.text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Positioned(
                  right: 16,
                  bottom: 30,
                  child: Text(
                    "CVV \n${controller.iscardnumbervisible ? controller.cvvController.text : controller.hideCvv()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ],
          )));
    });
  }
}
