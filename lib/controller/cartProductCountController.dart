import 'package:get/get.dart';

class CartProductCountController extends GetxController {
  Map productsCount = {};

  addproductcount(int id) {
    productsCount[id]++;

    update();
  }

  minusproductcount(int id) {
    if (productsCount[id] >=2) {
      productsCount[id]--;
    }

    update();
  }

  onproductCart(int id, int count) {
    productsCount[id] = count;
  }
}
