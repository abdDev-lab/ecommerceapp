import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:get/get.dart';

translateDataBase(colomen, colomar) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "en") {
    return colomen;
  } else {
    return colomar;
  }
}
