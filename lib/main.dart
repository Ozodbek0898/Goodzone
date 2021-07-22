import 'dart:async';
import 'package:flutter_goodzone1/data/dao/products_dao.dart';
import 'package:flutter_goodzone1/data/database/database.dart';
import 'package:flutter_goodzone1/network/api_client.dart';
import 'package:flutter_goodzone1/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/views/navigation_bar.dart';

Future<void> main() async{


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
    return MaterialApp(
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



