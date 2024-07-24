import 'package:ecommerceproject2/core/class/statusrequest.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
