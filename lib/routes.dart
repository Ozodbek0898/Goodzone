
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/views/basket_page.dart';
import 'package:flutter_goodzone1/views/favourite_page.dart';
import 'package:flutter_goodzone1/views/home_page.dart';
import 'package:flutter_goodzone1/views/profile_page.dart';
import 'package:flutter_goodzone1/views/search.dart';

class Routes extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search' : (context) => Search(),
        '/basket' : (context)=> BasketPage(),
        '/favourite' : (context) => FavouritePage(),
        '/profile' : (context)  => ProfilePage()
      },
    );
  }
}
