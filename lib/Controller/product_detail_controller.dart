import 'package:flutter_goodzone1/Model/product_detail.dart';
import 'package:flutter_goodzone1/network/repasitory/product_detail_repasitory.dart';
import 'package:flutter_goodzone1/network/servises/product_remote_service.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductDetailRepasitory productDetailRepasitory =
      ProductDetailRepasitory(ProductRemouteServise());

  ProductDetail product = ProductDetail();

  Future<void> fetchProductDetail(String slug) async {
    final result = await productDetailRepasitory.getProductDetail(slug);
    if (result is ProductDetail) {
      product = result;
      print('///////////${result.product?.gallery}');
      update();
    } else {

    }
  }
}
