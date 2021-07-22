

import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/database/database.dart';
import 'package:flutter_goodzone1/data/entities/popular_entity.dart';
import 'package:flutter_goodzone1/views/home_page.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class FavouriteController extends GetxController{
  HomeController controller = Get.put(HomeController());
  HomePage homePage = HomePage();
  List<Products> list=[];





  init() async {
    final dataBase = await $FloorProductDatabase.databaseBuilder(
        'app_database.db').build();
    final dao = dataBase.productDao;
    return dao;
  }



  void remove(Products products){


    for(int i=0;i<list.length;i++){
      if(products.id==list[i].id){
        list.removeAt(i);

      }
    }

  }





}