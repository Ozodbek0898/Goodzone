


import 'package:flutter_goodzone1/network/servises/product_remote_service.dart';

class ProductDetailRepasitory{

  late ProductRemouteServise productRemouteServise;

  ProductDetailRepasitory(this.productRemouteServise);


  Future<dynamic> getProductDetail(String slug) async {
    final response = await productRemouteServise.fetchProductDetail(slug);

    if (response.data != null) {
      print('jjjjjjjjjjjjjjjjjjj${response.data!.product!.name}');
      return response.data;
    } else if (response.getException()!.getErrorMessage() != 'Canceled') {
      return '';
    }
  }
}