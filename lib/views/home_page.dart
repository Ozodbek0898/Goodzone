import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_goodzone1/Controller/favourite_controller.dart';
import 'package:flutter_goodzone1/Controller/home_controller.dart';
import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/database/database.dart';
import 'package:flutter_goodzone1/data/entities/popular_entity.dart';
import 'package:flutter_goodzone1/views/discoun_page.dart';
import 'package:flutter_goodzone1/views/product_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = true;

  HomeController controller = Get.put(HomeController());
  FavouriteController controller1 = Get.put(FavouriteController());
  ProductsDao productsDao = ProductDatabase.instance!.productDao;

  Icon favorite(bool value) {
    if (value == false) {
      return Icon(
        Icons.favorite,
        color: Colors.grey,
      );
    } else
      return Icon(
        Icons.favorite,
        color: Colors.red,
      );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset("asset/logo.png"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.black54,
              ),
            )
          ],
        ),
        body: StreamBuilder(
          stream: productsDao.getProducts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<Products> list = snapshot.data;


              return ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: GetBuilder(builder: (HomeController controller) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CarouselSlider(
                            items: <Widget>[
                              for (var i = 0; i < controller.banner.length; i++)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.network(
                                      controller.banner[i].image!,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                            ],
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        );
                      })),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '??????????',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        InkWell(
                          child: Text(
                            '??????',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  GetBuilder(
                    builder: (HomeController controller) {
                      return SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.promos.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: (){
                                  Get.to(DiscountPage(controller.promos[index]));
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: SizedBox(
                                        width: 150,
                                        height: 100,
                                        child: Image.network(
                                          controller.promos[index].previewImage!,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 150,
                                        child: Text(
                                          controller.promos[index].title!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '????????????????????',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        InkWell(
                          child: Text(
                            '??????',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  GetBuilder(
                    builder: (HomeController controller) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popular.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Get.to(ProductPage(controller.popular[index]));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: SizedBox(
                                            width: 150,
                                            height: 100,
                                            child: Image.network(
                                              controller.popular[index].image!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            child: favorite(controller
                                                .popular[index].favorite),
                                            onTap: () {
                                              setState(() {
                                                controller
                                                        .popular[index].favorite =
                                                    !controller
                                                        .popular[index].favorite;
                                              });
                                              var pro = Products(
                                                  id: controller
                                                      .popular[index].id,
                                                  name: controller
                                                      .popular[index].name,
                                                  image: controller
                                                      .popular[index].image,
                                                  price: controller
                                                      .prices[index].oldPrice,
                                                  favorite: controller
                                                      .popular[index].favorite);
                                              if (controller
                                                      .popular[index].favorite ==
                                                  false) {
                                                productsDao.deleteProducts(pro);
                                              } else {
                                                productsDao.insertProducts(pro);
                                              }
                                              // var dao= productDatabase.productDao.insertProducts(controller.popular[index]);
                                            },
                                          ),
                                        )
                                      ],
                                      alignment: Alignment.topRight,
                                    ),
                                    SizedBox(
                                        width: 150,
                                        child: Text(
                                          controller.popular[index].name!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width: 150,
                                        child: Text(
                                          '${controller.prices[index].oldPrice!} ??????',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '??????????????????????????',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        InkWell(
                          child: Text(
                            '??????',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  GetBuilder(
                    builder: (HomeController controller) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.recommended.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: SizedBox(
                                            width: 150,
                                            height: 100,
                                            child: Image.network(
                                              controller
                                                  .recommended[index].image!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          Get.to(ProductPage(controller.recommended[index]));
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          child: favorite(controller
                                              .popular[index].recFavorite),
                                          onTap: () {
                                            setState(() {
                                              controller.popular[index]
                                                      .recFavorite =
                                                  !controller.popular[index]
                                                      .recFavorite;

                                            });
                                            var pro = Products(
                                                id: controller
                                                    .recommended[index].id,
                                                name: controller
                                                    .recommended[index].name,
                                                image: controller
                                                    .recommended[index].image,
                                                price: controller
                                                    .recPrice[index].price,
                                                favorite: controller
                                                    .popular[index]
                                                    .recFavorite);
                                            if (controller.popular[index]
                                                .recFavorite ==
                                                false) {
                                              productsDao.deleteProducts(pro);
                                            } else {
                                              productsDao.insertProducts(pro);
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                    alignment: Alignment.topRight,
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        controller.recommended[index].name!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        '${controller.recPrice[index].price} ??????',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  GetBuilder(
                    builder: (HomeController controller) {
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.brand.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              child:
                                  Image.network(controller.brand[index].image!),
                              borderRadius: BorderRadius.circular(16),
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              );
            } else
              return Container();
          },
        ));
  }
}
