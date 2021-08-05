


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20,top: 30,bottom: 30),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alice Steven',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
                Text('+998918150922',style: TextStyle(
                    color: Colors.black54,

                    fontSize: 20
                ),),
              ],
            ),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Icon(Icons.payment),
              Text('Оплата',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              SizedBox(width: 170
                ,),
              Icon(Icons.navigate_next,color: Colors.black12,)
            ],),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.auto_stories),
                Text('История заказов',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                SizedBox(width: 100
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.shopping_cart),
                Text('Магазины',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.settings),
                Text('Настройки',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.shopping_bag_outlined),
                Text('Сотрудничество',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                SizedBox(width: 100
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          Divider(height: 2,color: Colors.black12,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.contact_page),
                Text('Контакти',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),

        ],
      ),

    );
  }
}
