import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class VerifyCodeData {
  Crud crud = Crud();

  VerifyCodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postRequest(AppLink.verifycodeLink, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postRequest(AppLink.resendCodelink, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
