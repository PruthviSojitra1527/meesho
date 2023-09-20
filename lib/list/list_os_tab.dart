import 'package:flutter/material.dart';
import '../app_pages/My_Orders/myOrders.dart';
import '../app_pages/category_page/category_page.dart';
import '../app_pages/kurti/kurti.dart';
import '../app_pages/profile/profile_page.dart';
import '../decoration/imageurl.dart';
import '../decoration/strings.dart';
import '../model/model of  gown.dart';
import '../model/model of choli.dart';
import '../model/model of kurti.dart';
import '../model/model of sadi.dart';
import '../model/model of western.dart';
import '../old files/daily_deals.dart';
import '../app_pages/homepage/home tab page.dart';
import 'package:icons_flutter/icons_flutter.dart';

var tabpage = [
  HomePage(),
CategoryPage(),
 MyOrders(),
 ProfilePage(),
];

var tabs = [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      activeIcon: Icon(
        Icons.home_outlined,
        color: Colors.pink,
      ),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: Image.asset(
        icblackCategory,
        width: 26,
      ),
      activeIcon: Image.asset(
        icpinkCategory,
        width: 30,
      ),
      label: 'Category'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
      activeIcon: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.pink,
      ),
      label: 'My Orders'),
  BottomNavigationBarItem(
      icon: Icon(
        MaterialIcons.person_outline,
        color: Colors.black,
      ),
      activeIcon: Icon(
        MaterialIcons.person_outline,
        color: Colors.pink,
      ),
      label: 'Account'),
];
