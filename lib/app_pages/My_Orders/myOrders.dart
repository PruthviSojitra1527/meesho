import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/cart/cart_page.dart';
import 'package:meesho/app_pages/homepage/new_homepage.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/textstyle.dart';
import '../../authenticatioin/cart_authentication.dart';
import '../../commen/logo_meesho.dart';
import '../../consts/firebase_consts.dart';
import '../../decoration/imageurl.dart';
import '../splesh_screen/login_screen.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.off(LogIn());
        } else {
          Get.off( Cart());

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    var cart_controller = Get.put(CartController());
var i =0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        title: Text(
          'My Orders',
          style: stylemain(_width * 0.07, pinkcolor),
        ),
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            Get.to(Meesho());
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: _width * 0.07,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              color: fontGrey,
              size: _width * 0.07,
            ),
          ),
          SizedBox(width: _width * 0.04),
        ],
      ),
      body:
          Center(child: Logo()),

    );
  }
}
