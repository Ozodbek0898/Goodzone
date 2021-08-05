
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_goodzone1/Model/Carousel.dart';
import 'package:flutter_goodzone1/Model/brand.dart';
import 'package:flutter_goodzone1/Model/category.dart';
import 'package:flutter_goodzone1/Model/banner.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_goodzone1/Model/product_detail.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://dev.goodzone.uz/v1/')
abstract class ApiClient{

  factory  ApiClient(Dio dio,{String baseUrl})=_ApiClient;

  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );
  static ApiClient create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(alice.getDioInterceptor());
    return ApiClient(dio);

  }
  @GET("/promo")
  Future<CaruselResponse> getPromo();


  @GET("/banner")
  Future<BannerResponse> getBanner(
      @Query("limit") int limit);

  @GET("/brand")
  Future<BrandResponse> getBrand(
      @Query("limit") int limit);

  @GET("/product")
  Future<PopularResponse> getFamousProduct(
      @Query("limit") int limit,
      @Query("popular") bool popular);

  @GET("/product")
  Future<PopularResponse> getRecommended(
      @Query("limit") int limit,
      @Query("recommended") bool recommended);


  @GET("/category")
  Future<Category> getCategory(
      @Query("limit") int limit,
    );


  @GET("/product/{id}")
  Future<ProductDetail> getSlug(
      @Path("id") String id
      );




}