import 'package:flutter/material.dart';
class C5 extends StatefulWidget {
  const C5({Key? key}) : super(key: key);

  @override
  State<C5> createState() => _C5State();
}

class _C5State extends State<C5> with SingleTickerProviderStateMixin{
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
        Icons.home,
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
        Icons.people,
        color: Colors.black,
      ),
      child: Text(
        "Community",
        style: TextStyle(color: Colors.black, fontSize: 8),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person,
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
    return DefaultTabController(length: tabs.length, child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

      ),
    ));
  }
}
