import 'package:ecommerceproject2/binding/initialBinding.dart';
import 'package:ecommerceproject2/core/constant/themeData.dart';
import 'package:ecommerceproject2/core/localization/localChange.dart';
import 'package:ecommerceproject2/core/localization/translation.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/rootes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalChange controller = Get.put(LocalChange());
    return GetMaterialApp(
      locale: controller.language,
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      theme: controller.language!.languageCode == "ar" ? lightThemArabic : lightThem ,
      initialBinding: InitialBinding(),
      getPages: routes,
      textDirection: TextDirection.ltr,
      darkTheme: controller.language!.languageCode == "ar" ? darkThemArabic : darkThem,
    
    );
  }
}
