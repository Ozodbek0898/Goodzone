

import 'package:flutter_goodzone1/network/servises/search_remote_servise.dart';

class SearchRepasitory {

  late SearchRemoteService searchRemoteService;

  SearchRepasitory({required this.searchRemoteService});

  Future<dynamic> getCategory() async {
    final response = await searchRemoteService.fetchCategory();

    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }

}