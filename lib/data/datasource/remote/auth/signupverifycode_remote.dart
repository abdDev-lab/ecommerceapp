import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class SignupVerifyRemote {
  Crud crud = Crud();

  SignupVerifyRemote(this.crud);

  postData(String? verifycode, String email) async {
    var response = await crud.postRequest(AppLink.signupverifylink, {
      "verifycode": verifycode,
      "email": email,
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
