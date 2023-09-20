import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/homepage/new_homepage.dart';
import 'package:meesho/app_pages/profile/profilehelper.dart';
import 'package:meesho/authenticatioin/profile_authentication.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/commen/button.dart';
import 'package:meesho/consts/firebase_consts.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/imageurl.dart';
import 'package:meesho/decoration/size.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:meesho/list/lists.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../authenticatioin/auth_controller.dart';
import '../../commen/logo_meesho.dart';
import '../../decoration/strings.dart';
import '../../services/firestore_services.dart';
import '../cart/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:ui';

import '../splesh_screen/login_screen.dart';
import 'editProfile.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  QueryDocumentSnapshot? mydata;

  Media_size media_size = Media_size();

  var profilecontroller = Get.put(ProfileController());

  var authcontroller = Get.put(AuthController());

  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.off(LogIn());
        } else {
          Get.off(ProfileHelper());
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    var onpressedList = [
      profilemt(),
      helpCentermt(),
      changelanguagemt(),
      mybank_upimt(),
      mysharedProductsmt(),
      mypaymentsmt(),
      myviewedProductmt(),
      meeshocreditsmt(),
      legalPoliciesmt(),
      settingmt(),
    ];

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
      body: Center(child: Logo()),
    );
  }
}
