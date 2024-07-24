import 'package:ecommerceproject2/core/class/crud.dart';
import 'package:ecommerceproject2/core/constant/appLink.dart';

class Testdata {
  Crud crud = Crud() ; 
  
  Testdata(this.crud) ; 

  getData() async {
    var response  = await crud.postRequest(AppLink.testlink, {}) ; 
    
    return response.fold((l) => l, (r) => r) ; 

  }
  
}