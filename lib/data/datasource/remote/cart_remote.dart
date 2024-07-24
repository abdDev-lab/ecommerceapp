import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class CartData {
  Crud crud = Crud();

  CartData(this.crud);

  addCart(
    String productid,
    String id,
    String productCount,
    String productColor,
    String? productSizeOrStorage,
  ) async {
    var response = await crud.postRequest(AppLink.addCartlink, {
      "productid": productid,
      "userid": id,
      "productcount": productCount,
      "productcolor": productColor,
      "productsizeorstorage": productSizeOrStorage,
    });

    return response.fold((l) => l, (r) => r);
  }

  removeCart(String productid, String id, String cartid) async {
    var response = await crud.postRequest(AppLink.removeCartlink,
        {"productid": productid, "userid": id, "cartid": cartid});

    return response.fold((l) => l, (r) => r);
  }

  updatecountproductCart(
      String cartid, String id, String productcount) async {
    var response = await crud.postRequest(AppLink.updatecountproductCartlink,
        {"cartid": cartid, "userid": id, "productcount": productcount});

    return response.fold((l) => l, (r) => r);
  }

  getDataCart(String id) async {
    var response = await crud.postRequest(AppLink.cartlink, {"userid": id});

    return response.fold((l) => l, (r) => r);
  }
}
