import 'package:dio/dio.dart';
import 'package:flutter_goodzone1/Model/Carousel.dart';
import 'package:flutter_goodzone1/Model/brand.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/Model/banner.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/network/api_client.dart';
import 'package:flutter_goodzone1/network/error/responsHandler.dart';
import 'package:flutter_goodzone1/network/error/server_error.dart';

class HomeRemoteService {
  ApiClient apiClient = ApiClient.create();

  Future<ResponseHandler<BannerResponse>> fetchBanner() async {
    BannerResponse response;

    try {
      response = await apiClient.getBanner(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<CaruselResponse>> fetchCarousel() async {
    CaruselResponse response;

    try {
      response = await apiClient.getPromo();
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<ResponseHandler<PopularResponse>> fetchPopularProducts() async {
    PopularResponse response;

    try {
      response = await apiClient.getFamousProduct(10,true);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<ResponseHandler<PopularResponse>> fetchRecommended() async {
    PopularResponse response;

    try {
      response = await apiClient.getRecommended(10,true);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<ResponseHandler<BrandResponse>> fetchBrand() async {
    BrandResponse response;

    try {
      response = await apiClient.getBrand(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
}
