import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/decoration/imageurl.dart';

import '../../commen/logo_meesho.dart';
import '../../consts/firebase_consts.dart';
import '../homepage/new_homepage.dart';
import 'login_screen.dart';

class SpleshScreeen extends StatefulWidget {
  const SpleshScreeen({Key? key}) : super(key: key);

  @override
  State<SpleshScreeen> createState() => _SpleshScreeenState();
}

class _SpleshScreeenState extends State<SpleshScreeen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.off(LogIn());
        } else {
          Get.off(Meesho());
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: _height,
            width: _width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  backgroundimage,
                ),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
            ),
            child: Logo(),
          ),
        ],
      ),
    );
  }
}
