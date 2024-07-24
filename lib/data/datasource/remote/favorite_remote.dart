import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class Favoritedata {
  Crud crud = Crud();

  Favoritedata(this.crud);

  addFav(String productid, String id) async {
    var response = await crud.postRequest(AppLink.addfavoratelink, {
      "productid" : productid , 
      "userid" : id
    });

    return response.fold((l) => l, (r) => r);
  }
  removeFav(String productid, String id) async {
    var response = await crud.postRequest(AppLink.removefavoratelink, {
      "productid" : productid , 
      "userid" : id
    });

    return response.fold((l) => l, (r) => r);
  }
}
