// ignore_for_file: file_names

import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/localization/localChange.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(LocalChange());
  }

}
