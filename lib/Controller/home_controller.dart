import 'package:flutter_goodzone1/Model/Carousel.dart';
import 'package:flutter_goodzone1/Model/brand.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/Model/banner.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/network/repasitory/home_repasitory.dart';
import 'package:flutter_goodzone1/network/servises/home_remote_servise.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Promos> promos = [];
  List<Banners> banner = [];
  List<Products> popular= [];
  List<Price> prices= [];
  List<Products> recommended= [];
  List<Price> recPrice=[];
  List<Brands> brand= [];
  HomeRepository _homerepasitory =
      HomeRepository(homeRemoteService: HomeRemoteService());


  @override
  void onInit() {
    fetchCarousel();
    fetchBanner();
    fetchPopularProducts();
    fetchRecommended();
    fetchBrand();
    update();
    super.onInit();
  }

  Future<void> fetchCarousel() async {
    final result = await _homerepasitory.getCarousels();
    if (result is CaruselResponse) {
      promos = result.promos ?? [];
      update();
    }else {

    }
  }

  Future<void> fetchBanner() async {
    final result = await _homerepasitory.getBanner();
    if (result is BannerResponse) {
      banner = result.banners ?? [];

      update();
    }else {

    }
  }
  Future<void> fetchBrand() async {
    final result = await _homerepasitory.getBrand();
    if (result is BrandResponse) {
      brand = result.brands ?? [];

      update();
    }else {

    }
  }
  Future<void> fetchPopularProducts() async {
    final result = await _homerepasitory.getPopularProducts();
    if (result is PopularResponse) {
      popular = result.products?? [];
      List<Price> list=[];

      for(int i=0;i<result.products!.length;i++){
        list.add(result.products![i].price!);
        print(result.products![i].price!.toJson());
      }

      prices=list;


      update();
    }else {

    }
  }
  Future<void> fetchRecommended() async {
    final result = await _homerepasitory.getRecommended();
    if (result is PopularResponse) {
      recommended = result.products?? [];
      List<Price> list=[];
      for(int i=0;i<result.products!.length;i++){
        list.add(result.products![i].price!);

      }
      recPrice=list;
      print('?????${recPrice}');
      update();
    }else {

    }
  }



}
