import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class Productsdata {
  Crud crud = Crud();

  Productsdata(this.crud);

  getData(String idcat, String? idsubcat, String id) async {
    var response = await crud.postRequest(AppLink.productlink,
        {"categorie": idcat, "subcategorie": idsubcat, "userid": id});

    return response.fold((l) => l, (r) => r);
  }

  getSearchData(String search, String id) async {
    var response = await crud
        .postRequest(AppLink.searchlink, {"search": search, "userid": id});

    return response.fold((l) => l, (r) => r);
  }
}
