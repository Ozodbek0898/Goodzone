


import 'package:dio/dio.dart';
import 'package:flutter_goodzone1/Model/category.dart';
import 'package:flutter_goodzone1/network/error/responsHandler.dart';
import 'package:flutter_goodzone1/network/error/server_error.dart';

import '../api_client.dart';

class SearchRemoteService{
  ApiClient apiClient = ApiClient.create();

  Future<ResponseHandler<Category>> fetchCategory() async {
    Category response;

    try {
      response = await apiClient.getCategory(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
}