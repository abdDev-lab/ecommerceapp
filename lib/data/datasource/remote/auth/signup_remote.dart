import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class SignUpData {
  Crud crud = Crud();

  SignUpData(this.crud);

  postData(String username, String email, String password,
      String phonenumber) async {
    var response = await crud.postRequest(AppLink.signuplink, {
      "username": username,
      "email": email,
      "password": password,
      "phonenumber": phonenumber,
    });

    return response.fold((l) => l, (r) => r);
  }
}
