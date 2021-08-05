

import 'package:dio/dio.dart';
import 'package:flutter_goodzone1/Model/product_detail.dart';
import 'package:flutter_goodzone1/network/error/responsHandler.dart';
import 'package:flutter_goodzone1/network/error/server_error.dart';

import '../api_client.dart';

class ProductRemouteServise {

  ApiClient apiClient = ApiClient.create();


  Future<ResponseHandler<ProductDetail>> fetchProductDetail( String slug) async {
    ProductDetail response;

    try {
      response = await apiClient.getSlug(slug);
      print('gggggggggggggggggggggggggggg${response.product!.name}');
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
}