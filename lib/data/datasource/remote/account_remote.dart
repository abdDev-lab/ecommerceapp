import 'dart:io';

import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class Accountdata {
  Crud crud = Crud();

  Accountdata(this.crud);

  updateUserDatawithimage(
    String userid,
    String username,
    File file,
  ) async {
    var response = await crud.postRequestwithImage(
        AppLink.accountlinkforimage,
        {
          "userid": userid,
          "username": username,
        },
        file);

    return response.fold((l) => l, (r) => r);
  }

  updateUserData(
    String userid,
    String username,
  ) async {
    var response = await crud.postRequest(
      AppLink.accountlink,
      {
        "userid": userid,
        "username": username,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}
