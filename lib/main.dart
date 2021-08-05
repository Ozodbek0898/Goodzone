import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/database/database.dart';
import 'package:flutter_goodzone1/network/api_client.dart';
import 'package:flutter_goodzone1/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/views/navigation_bar.dart';
import 'package:get/get.dart';

Future<void> main() async{

SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.white
));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black
              ))),
      navigatorKey: ApiClient.alice.getNavigatorKey(),
        home: SplashScreen()

    );
  }
}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    ProductDatabase.getInstance();
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) { return NavigationBar();}));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('asset/logo.png'),
      ),
    );
  }
}



