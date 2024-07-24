import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class FavoriteProductdata {
  Crud crud = Crud();

  FavoriteProductdata(this.crud);

  getData(String id) async {
    var response =
        await crud.postRequest(AppLink.favorateproductlink, {"userid": id});
    return response.fold((l) => l, (r) => r);
  }
}
