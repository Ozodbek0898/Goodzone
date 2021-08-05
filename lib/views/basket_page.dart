import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/Controller/basket_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  BasketController basketController = Get.put(BasketController());


  checkNull() {
    if (basketController.getProducts() != []) {
      return Container(
        color: Colors.white,
        child: GetBuilder(
          builder: (BasketController controller) {
            return ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            controller.list[index].product?.image ?? "",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,



                          ),

                        ),
                      ),
                    ),
                    Column(

                      children: [
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: Text(controller.list[index].product!.name!,
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Text('${controller.list[index].product!.price!.price!} Сум',
                        style: TextStyle(color: Colors.red,fontSize: 20), ),

                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(backgroundColor: Colors.grey,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Icon(FontAwesomeIcons.minus,size: 15),
                                  ),onPressed: (){
                                if(controller.count>0){
                                 controller.decrease();

                                }

                              }),
                            ),
                            Padding(padding: EdgeInsets.all(10),
                            child: Text(controller.count.toString(),style: TextStyle(fontSize: 20),)),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(backgroundColor: Colors.grey,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Icon(FontAwesomeIcons.minus,size: 15),
                                  ),onPressed: (){
                                controller.increase();



                                  }),
                            ),

                          ],
                        )
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      );
    } else
      return Container(
        child: Center(
          child: Image.asset(
            'asset/Capture1.PNG',
            height: 300,
            width: 300,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset("asset/logo.png"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.delete,
                color: Colors.black54,
              ),
            )
          ],
        ),
        body: checkNull());
  }
}
