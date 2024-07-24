import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/constant/appasset.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/orders_remote.dart';
import 'package:ecommerceproject2/data/model/orders_model.dart';
import 'package:get/get.dart';

abstract class OrdersPageController extends GetxController {
  getData();
  deleteorder(String orderid);
  orderstatusimage(int orderstatus, int deliverytype);
}

class OrdersPageControllerImp extends OrdersPageController {
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List<OrdersModel> data = [];
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.reversed.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  String orderstatusimage(int orderstatus, int deliverytype) {
    if (orderstatus == 0) {
      return AppAsset.orderwaiting;
    }
    if (orderstatus == 1) {
      return AppAsset.orderconfirm;
    }
    if (orderstatus == 3) {
      return AppAsset.ontheway;
    }
    if (orderstatus == 4 && deliverytype == 1) {
      return AppAsset.pickup;
    }
    if (orderstatus == 4 && deliverytype == 0) {
      return AppAsset.ontheway;
    }
    if (orderstatus == 5) {
      return AppAsset.orderconfirm;
    }
    return "" ; 
  }

  gotoDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRoutes.ordersdetails, arguments: {
      "ordersmodel": ordersModel,
    });
  }

  @override
  deleteorder(String orderid) async {
    var response = await ordersData.deleteOrder(
        myServices.sharedPreferences.getInt("id").toString(), orderid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }
}
