import 'package:flutter_goodzone1/network/servises/home_remote_servise.dart';

class HomeRepository {
  late HomeRemoteService homeRemoteService;

  HomeRepository({required this.homeRemoteService});

  Future<dynamic> getBanner() async {
    final response = await homeRemoteService.fetchBanner();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }


  Future<dynamic> getCarousels() async {
    final response = await homeRemoteService.fetchCarousel();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }
  Future<dynamic> getPopularProducts() async {
    final response = await homeRemoteService.fetchPopularProducts();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }
  Future<dynamic> getRecommended() async {
    final response = await homeRemoteService.fetchRecommended();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }
  Future<dynamic> getBrand() async {
    final response = await homeRemoteService.fetchBrand();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }
}
