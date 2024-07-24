import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class CheckoutData {
  Crud crud = Crud();

  CheckoutData(this.crud);

  getcouponData(String couponName) async {
    var response =
        await crud.postRequest(AppLink.couponlink, {"couponname": couponName});
    return response.fold((l) => l, (r) => r);
  }

  checkoutorder(
    String userid,
    String loclat,
    String loclang,
    String deliveryType,
    String deliveryPrice,
    String totalePrice,
    String paymentmethod , 
    String coupon,
  ) async {
    var response = await crud.postRequest(AppLink.takeorderslink, {
      "userid": userid,
      "loc_lat": loclat,
      "loc_lang": loclang,
      "deliveryType": deliveryType,
      "deliveryPrice": deliveryPrice,
      "price": totalePrice,
      "paymentmethod": paymentmethod,
      "coupon": coupon,
    });
    return response.fold((l) => l, (r) => r);
  }
}
