



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodzone1/views/favourite_page.dart';
import 'package:flutter_goodzone1/views/home_page.dart';
import 'package:flutter_goodzone1/views/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
           HomePage(),
        Search(),
          FavouritePage()
          ,Center(
            child: Text("4"),
          ),Center(
            child: Text("5"),
          ),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(FontAwesomeIcons.shoppingBasket),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person),
          ),
        ],
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
