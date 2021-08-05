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

  FavouriteController controller = Get.put(FavouriteController());

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Izbrenno",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<List<Products>>(
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty ) {
            List<Products> list = snapshot.data!;
            return GetBuilder(
              builder: (FavouriteController controller) {
                return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
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
                                  list[index].image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: favorite(list[index].favorite),
                                onTap: () {



                                  setState(() {
                                    for(int i=0;i<homeController.popular.length;i++){
                                      if(list[index].id==homeController.popular[i].id){
                                        homeController.popular[i].favorite =
                                        !homeController.popular[i].favorite;
                                      }
                                      if(list[index].id==homeController.recommended[i].id){
                                        homeController.popular[i].recFavorite =
                                        !homeController.popular[i].recFavorite;
                                      }
                                    }

                                    productsDao.deleteProducts(list[index]);
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
                            list[index].name!,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            '${list[index].price} Сум',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          } else
           return Container(
             color: Colors.white,
             child: Center(
             child: Image.asset('asset/Capture.PNG',width: 150,height: 200,),
           ),);
        },
        stream: controller.productsDao.getProducts(),
      ),
    );
  }
}
