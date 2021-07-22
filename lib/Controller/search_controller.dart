

import 'package:flutter_goodzone1/Model/category.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/network/repasitory/search_repasitory.dart';
import 'package:flutter_goodzone1/network/servises/search_remote_servise.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  List<Categories> category=[];

  SearchRepasitory searchRepository=SearchRepasitory(searchRemoteService: SearchRemoteService());



  @override
  void onInit() {
   fetchCategory();
    update();
    super.onInit();
  }


  Future<void> fetchCategory() async {
    final result = await searchRepository.getCategory();
    if (result is Category) {
   category= result.categories ?? [];
    }else {

    }
  }

}