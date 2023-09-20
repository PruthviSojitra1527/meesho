import 'package:flutter/material.dart';
import 'package:meesho/old%20files/3.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var tabpage = [
    Scaffold(
      body: Container(
        color: Colors.pink[100],
        child: Icon(
          Icons.border_all_outlined,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Icon(
          Icons.woman,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.purple[100],
        child: Icon(
          Icons.border_all_outlined,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.yellow[100],
        child: Icon(
          Icons.border_all_outlined,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.green[100],
        child: Icon(
          Icons.border_all_outlined,
          color: Colors.black,
        ),
      ),
    ),
  ];
  var tabs = [
    Tab(
      icon: Icon(
        Icons.border_all_outlined,
        color: Colors.pink,
      ),
      child: Text(
        "All",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.woman,
        color: Colors.yellow[800],
      ),
      child: Text(
        "women",
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person,
        color: Colors.yellow[900],
      ),
      child: Text(
        "Men",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.people,
        color: Colors.pink[100],
      ),
      child: Text(
        "Kids",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Tab(
      icon: Icon(
        Icons.tv,
        color: Colors.black,
      ),
      child: Text(
        "Other",
        style: TextStyle(
          color: Colors.black,
        ),
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
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              title: Text(
                'Pruthvi Sojitra',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: false,
              expandedHeight: 170.0,
              backgroundColor: Colors.grey[100],
              leading: IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 40,
                ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
              pinned: true,
              flexibleSpace: ListView(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      bottom: 12.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Search by Keyword or Product ID",
                          border: InputBorder.none,
                          icon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_outlined)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottom: TabBar(tabs: tabs),
            ),
          ],
          body: Container(
            color: Colors.pink[200],
            child: C3(),
          ),
        ),
      ),
    );
  }
}
