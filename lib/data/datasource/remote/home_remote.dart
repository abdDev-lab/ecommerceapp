import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class Homedata {
  Crud crud = Crud();

  Homedata(this.crud);

  getData(String id) async {
    var response = await crud.postRequest(AppLink.homelink, {"userid": id});

    return response.fold((l) => l, (r) => r);
  }

  getSearchData(String search, String id) async {
    var response = await crud
        .postRequest(AppLink.searchlink, {"search": search, "userid": id});

    return response.fold((l) => l, (r) => r);
  }

  getGiftCoupon() async {
    var response = await crud.postRequest(AppLink.giftcouponlink, {});
    return response.fold((l) => l, (r) => r);
  }
}
