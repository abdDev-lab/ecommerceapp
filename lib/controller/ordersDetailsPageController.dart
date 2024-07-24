import 'package:ecommerceproject2/core/class/statusrequest.dart';
import 'package:ecommerceproject2/core/functions/handlingdata.dart';
import 'package:ecommerceproject2/core/services/myServices.dart';
import 'package:ecommerceproject2/data/datasource/remote/orders_remote.dart';
import 'package:ecommerceproject2/data/model/ordersDetails_model.dart';
import 'package:ecommerceproject2/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersDetailsPageController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late OrdersModel ordersModel;
  bool viewall = false;
  bool orderdeliverycodevisible = false ; 
  List<OrdersDetailsModel> data = [];
  List<OrdersDetailsModel> datareduce = [];
  Map orderStatus = {};
  int orderslength = 4;
  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];

    getOrderDetails();

    orderStatus = {
      0: "orderstatus00".tr,
      1: "orderstatus0".tr,
      2: "orderstatus1".tr,
      3: "orderstatus2".tr,
      4: ordersModel.ordersDeliverytype == 0
          ? "orderstatus3".tr
          : "orderstatus5".tr,
      5: "orderstatus4".tr
    };
      //orderslength = ordersModel.ordersDeliverytype == 0 ? 4 : 3;
    super.onInit();
  }

  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getOrderDetails(
        myServices.sharedPreferences.getInt("id").toString(),
        ordersModel.ordersId.toString());

    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => OrdersDetailsModel.fromJson(e)));
        if (data.length > 3) {
          datareduce.addAll(data.take(3));
          viewall = true;
        } else {
          datareduce.addAll(data);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  double formateToTwoDecimalPlaces(double number) {
    String formatnumber = number.toStringAsFixed(2);
    double newNumber = double.parse(formatnumber);
    return newNumber;
  }
}
