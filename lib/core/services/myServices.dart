// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD3cbDKM8i3bQwm4eemfS08hR-AVTTtUXk",
            appId: "1:932275925874:android:11cd93f8b450f1b280a3eb",
            messagingSenderId: "932275925874",
            projectId: "amarcket-90ff4"));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}


initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
