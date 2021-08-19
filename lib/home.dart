import 'package:asos/pages/cart.dart';
import 'package:asos/pages/homepage.dart';
import 'package:asos/pages/orders.dart';
import 'package:asos/pages/products.dart';
import 'package:asos/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:asos/utils/colors.dart';
import 'package:asos/utils/placeholder.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Homepage(),
    Product("All Product","1"),
    Cart(),
    Orders(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.star),
            title: Text("Product"),
            selectedColor: primaryColor,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Shopping"),
            selectedColor: primaryColor,
          ),


          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.fiber_smart_record),
            title: Text("My Order"),
            selectedColor: primaryColor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor:primaryColor,
          ),
        ],
      ),
    );
  }


}
