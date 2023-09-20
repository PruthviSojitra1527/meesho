import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/authenticatioin/auth_controller.dart';
import 'package:meesho/decoration/strings.dart';
import 'package:meesho/decoration/textstyle.dart';

import '../app_pages/splesh_screen/login_screen.dart';
import '../list/lists.dart';
import 'color.dart';
import 'imageurl.dart';

class Media_size extends StatefulWidget {
  const Media_size({Key? key}) : super(key: key);

  @override
  State<Media_size> createState() => _Media_sizeState();
}

class _Media_sizeState extends State<Media_size> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;


    return GestureDetector(
        onTap: () {
        Get.to(Scaffold());
        },
    );
  }

  appbar(size) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Image.asset(
        backgroundimage,
        fit: BoxFit.fill,
      ),
      backgroundColor: whiteColor,
      title: Text(
        category,
        style: stylemain(size, pinkcolor),
      ),
      leading: IconButton(
        color: darkFontGrey,
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_sharp,
          size: size,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.favorite_border,
            color: fontGrey,
            size: size,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: fontGrey,
            size: size,
          ),
        ),
        SizedBox(width: size),
      ],
    );
  }
}
profilemt(){}
helpCentermt(){}
changelanguagemt(){}
mybank_upimt(){}
mysharedProductsmt(){}
mypaymentsmt(){}
myviewedProductmt(){}
meeshocreditsmt(){}
legalPoliciesmt(){}
settingmt(){}
logoutmt(context)async{
  await Get.put(AuthController()).signOutMethod(context);
  Get.offAll(()=>LogIn());
}