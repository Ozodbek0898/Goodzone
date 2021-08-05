


import 'package:flutter_goodzone1/Model/product_detail.dart';
import "package:get/get.dart";

class BasketController extends GetxController{

  List<ProductDetail> list=[];
  int count= 0;


  void increase(){
    count++;
    update();
  }
  void decrease(){
    count--;
    update();
  }




  setProduct(ProductDetail productDetail){
print("dgsduiufhds");
    list.add(productDetail);
  }

getProducts(){
    return list;
}
}