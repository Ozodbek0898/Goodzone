import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_goodzone1/Controller/basket_controller.dart';
import 'package:flutter_goodzone1/Controller/product_detail_controller.dart';
import 'package:flutter_goodzone1/Model/popular.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  Products products;

  ProductPage(this.products);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductDetailController productDetailController =
      Get.put(ProductDetailController());
  BasketController basketController=Get.put(BasketController());

  @override
  void initState() {
    productDetailController.fetchProductDetail(widget.products.slug!);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Icon(Icons.favorite_border),
            SizedBox(
              width: 10,
            )
          ],
          title: GetBuilder(
            builder: (ProductDetailController controller) {
              return Center(
                child: Text(
                  controller.product.product?.category?.name ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              );
            },
          )),
      body: Stack(
        children: [
          GetBuilder(
            builder: (ProductDetailController controller) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: 200,
                      child: CachedNetworkImage(
                        height: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl: controller.product.product?.image ?? '',
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.product.product?.gallery?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            borderOnForeground: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: controller
                                        .product.product?.gallery?[index] ??
                                    '',
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      controller.product.product?.name ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${controller.product.product?.price?.price ?? ""} Сум',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Html(
                        data: controller.product.product?.description ?? "",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    basketController.setProduct(productDetailController.product);


                  },
                  child: Container(
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Добавить в корзину',
                          style: TextStyle(
                              color: Colors.white,
                          fontSize: 17),
                        ),
                      ],
                    ),
                    ),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
