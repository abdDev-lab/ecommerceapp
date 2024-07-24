import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class CheckEmailData {
  Crud crud = Crud();

  CheckEmailData(this.crud);

  postData(
    String email , 
  ) async {
    var response = await crud.postRequest(AppLink.checkemailLink, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}