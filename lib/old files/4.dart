import 'package:flutter/material.dart';

class C4 extends StatefulWidget {
  const C4({Key? key}) : super(key: key);

  @override
  State<C4> createState() => _C4State();
}

class _C4State extends State<C4> with SingleTickerProviderStateMixin {
  var tabpage = [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  var tabs = [
    Tab(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      // text:"Home",
      child: Text(
        "Home",
        style: TextStyle(color: Colors.black, fontSize: 9),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.category_outlined,
        color: Colors.black,
      ),
      child: Text(
        "Categories",
        style: TextStyle(color: Colors.black, fontSize: 9),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
      child: Text(
        "My Orders",
        style: TextStyle(color: Colors.black, fontSize: 9),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.people_outline,
        color: Colors.black,
      ),
      child: Text(
        "Community",
        style: TextStyle(color: Colors.black, fontSize: 8),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person_outline_outlined,
        color: Colors.black,
      ),
      child: Text(
        "Account",
        style: TextStyle(color: Colors.black, fontSize: 9),
      ),
    ),
    // Tab(icon: Icon(Icons.call),),
  ];
  TabController? tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: (tabpage.length), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: tabs.length,
          child: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: TabPageSelector(),
                  ),
                  Expanded(
                    child: IconTheme(
                      data: IconThemeData(
                        size: 50,
                        color: Colors.black,
                      ),
                      child: TabBarView(children: tabs),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
