import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class NotificationsData {
  Crud crud = Crud();

  NotificationsData(this.crud);

  getData(String id) async {
    var response = await crud.postRequest(AppLink.notificationslink, {"userid": id});
    return response.fold((l) => l, (r) => r);
  }

  readNotifications(String id) async {
    var response = await crud.postRequest(AppLink.notificationsreadlink, {"userid": id});
    return response.fold((l) => l, (r) => r);
  }

  
}