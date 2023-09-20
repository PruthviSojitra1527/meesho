import 'package:flutter/material.dart';

import '../decoration/textstyle.dart';
import '../app_pages/homepage/home tab page.dart';

class C3 extends StatefulWidget {
  const C3({Key? key}) : super(key: key);

  @override
  State<C3> createState() => _C3State();
}

class _C3State extends State<C3> with SingleTickerProviderStateMixin {
  var tabpage = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  TabController? _tabcontroller;

  var tabs = [
    Tab(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      // text:"Home",
      child: Black029(data: 'Home'),
    ),
    Tab(
      icon: Icon(
        Icons.category_outlined,
        color: Colors.black,
      ),
      child: Black029(data: 'Categories'),
    ),
    Tab(
      icon: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
      child: Black029(data: 'My Orders'),
    ),
    Tab(
      icon: Icon(
        Icons.people_outline,
        color: Colors.black,
      ),
      child: Black029(
        data: "Community",
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person_outline_outlined,
        color: Colors.black,
      ),
      child: Black029(
        data: "Account",
      ),
    ),
    // Tab(icon: Icon(Icons.call),),
  ];
  int isSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = TabController(length: (tabpage.length), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TabBarView(
          children: tabpage,
          controller: _tabcontroller,
        ),
        bottomNavigationBar: Material(
          color: Colors.grey[100],
          child: TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: tabs,
            controller: _tabcontroller,
          ),
        ),
      ),
    );
  }
}
