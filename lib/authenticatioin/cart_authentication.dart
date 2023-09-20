import 'package:get/get.dart';

class CartController extends GetxController{
  RxInt totalP = 0.obs;
  calculate(data){
    totalP.value=0;
    for(var i = 0;i<data.length;i++){
      // print(data[i]['tprice']);
      double d = data[i]['tprice'];
      // print(d.toInt());
      totalP.value = totalP.value + d.toInt();
    }
  }
}