import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaymentPageController extends GetxController {
  onCardNumberChanged();
  onDateChanged();
  onPressShowCardNumber();
  onPressCach();
  onSubmit();
}

class PaymentPageControllerImp extends PaymentPageController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController cardNumberController;
  late TextEditingController dateController;
  late TextEditingController cvvController;
  late String text;
  double bottomSheetHeight = 370;
  double textFieldHeight = 50;
  bool cashSelected = true;
  bool creditSelected = false;
  bool isvisaCard = false;
  bool cardvisible = false;
  bool iscardnumbervisible = false;
  @override
  void onInit() {
    nameController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
    cardNumberController.addListener(onCardNumberChanged);
    dateController.addListener(onDateChanged);

    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  void onCardNumberChanged() {
    String text = cardNumberController.text.replaceAll(RegExp(r'\s+'), '');
    String formattedText = formatCardNumber(text);

    // Update the text field only if necessary
    if (cardNumberController.text != formattedText) {
      cardNumberController.value = cardNumberController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  String formatCardNumber(String input) {
    input = input.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

    // Insert space every 4 characters
    String result = '';
    if (input.isNotEmpty) {
      if (input[0] == "4") {
        isvisaCard = true;
      } else {
        isvisaCard = false;
      }
    } else {
      isvisaCard = false;
    }
    for (int i = 0; i < input.length; i++) {
      if (i > 0 && i % 4 == 0) {
        result += ' ';
      }
      result += input[i];
    }
    update();
    return result;
  }

  @override
  void onDateChanged() {
    String text = dateController.text;
    String formattedText = formatDate(text);

    // Update the text field only if necessary
    if (dateController.text != formattedText) {
      dateController.value = dateController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  String formatDate(String input) {
    input = input.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

    // Insert space every 4 characters
    String result = '';
    for (int i = 0; i < input.length; i++) {
      if (i == 2) {
        result += '/';
      }
      result += input[i];
    }

    return result;
  }

  @override
  onPressCach() {
    cashSelected = true;
    creditSelected = false;
    cardvisible = false;
    update();
  }

  String hideCardNumber(String input) {
    return input.replaceRange(0, 14, "xxxx xxxx xxxx");
  }
  String hideCvv(){
    return "xxx";
  }
  @override
  onPressShowCardNumber() {
    iscardnumbervisible = !iscardnumbervisible;
    update();
  }

  @override
  onSubmit() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      bottomSheetHeight = 370;
      textFieldHeight = 50;
      cardvisible = true;
      cashSelected = false;
      creditSelected = true;
      Get.back();
    } else {
      bottomSheetHeight = 450;
      textFieldHeight = 80;
    }
    update();
  }
}
