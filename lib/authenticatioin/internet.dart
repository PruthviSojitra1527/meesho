import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  String result = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConecction();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("appBar"),
        ),
        body: Center(
          child: Text(
            result,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  checkInternetConecction() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi ) {
        setState(() {
          result = 'connected';
        });
      } else {
        setState(() {
          result = 'No Internet';
        });
      }
    });
  }
}
