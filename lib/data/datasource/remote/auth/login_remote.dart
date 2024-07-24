import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class LoginData {
  Crud crud = Crud();

  LoginData(this.crud);

  postData(
    String email , 
    String password,
  ) async {
    var response = await crud.postRequest(AppLink.loginlink, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
