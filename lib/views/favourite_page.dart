

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/Controller/favourite_controller.dart';
import 'package:flutter_goodzone1/Controller/home_controller.dart';
import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/database/database.dart';
import 'package:flutter_goodzone1/data/entities/popular_entity.dart';
import 'package:get/get.dart';

class FavouritePage extends StatefulWidget {


  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  ProductsDao productsDao=ProductDatabase.productsDao();
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
  FavouriteController controller=Get.put(FavouriteController());

  HomeController homeController=Get.put(HomeController());

  view(){
    if(controller.list==[]){
      return Container(
        color: Colors.red,
      );
    }else{
      return GetBuilder(builder: (FavouriteController controller) {
        return GridView.builder(
            itemCount: controller.list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 150,
                          height: 100,
                          child: Image.network(
                            controller.list[index].image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: favorite(
                              controller.list[index].favorite),
                          onTap: () {
                            var pro=Products(id: controller.list[index].id,
                                name: controller.list[index].name,image: controller.list[index].image,
                                favorite: controller.list[index].favorite);
                            setState(() {
                              controller.list[index].favorite =
                              !controller
                                  .list[index].favorite;
                              controller.remove(pro);
                              homeController.popular[index].favorite=!homeController.popular[index].favorite;

                            });
                          },
                        ),
                      )
                    ],
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                      width: 150,
                      child: Text(
                        controller.list[index].name!,
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
                        '${controller.list[index].price} Сум',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              );

            });

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Izbrenno",style: TextStyle(color: Colors.black),),
      ),
      body: view()
    );
  }
}
