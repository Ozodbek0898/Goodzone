import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/Controller/search_controller.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Категории',
          style: TextStyle(color: Colors.black),
        ),

      ),
      body: Container(

        child: Padding(
          padding: EdgeInsets.only(top: 10),


          child: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),


                child: TextField(
                  autofocus: false,

                  decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
              ),
              Expanded(

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchController.category.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 150,
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    searchController.category[index].name!,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Image.network(
                                    searchController.category[index].image!,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
