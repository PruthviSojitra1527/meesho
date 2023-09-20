import 'package:flutter/material.dart';
import 'package:meesho/decoration/color.dart';

import '../../decoration/strings.dart';
import '../../list/list_os_tab.dart';

class Meesho extends StatefulWidget {
  const Meesho({Key? key}) : super(key: key);
  @override
  State<Meesho> createState() => _MeeshoState();
}

class _MeeshoState extends State<Meesho> with TickerProviderStateMixin {
  TabController? tabcontroller;

  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: (tabpage.length), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: tabpage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: tabs,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey[500],
          iconSize: 30,
          elevation: 5,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
