import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class OrdersData {
  Crud crud = Crud();

  OrdersData(this.crud);

  getData(String id) async {
    var response = await crud.postRequest(AppLink.orderslink, {"userid": id});

    return response.fold((l) => l, (r) => r);
  }

  getOrderDetails(String id, String orderid) async {
    var response = await crud.postRequest(
        AppLink.ordersdetails, {"userid": id, "orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String id, String orderid) async {
    var response = await crud.postRequest(
        AppLink.deleteorders, {"userid": id, "orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }


}
