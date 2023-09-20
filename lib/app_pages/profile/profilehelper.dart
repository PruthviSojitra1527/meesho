import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/commen/logo_meesho.dart';

import '../../authenticatioin/auth_controller.dart';
import '../../commen/button.dart';
import '../../consts/firebase_consts.dart';
import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/strings.dart';
import '../../decoration/textstyle.dart';
import '../../services/firestore_services.dart';
import '../cart/cart_page.dart';
import '../homepage/new_homepage.dart';
import '../splesh_screen/login_screen.dart';

class ProfileHelper extends StatefulWidget {
  const ProfileHelper({Key? key}) : super(key: key);

  @override
  State<ProfileHelper> createState() => _ProfileHelperState();
}

class _ProfileHelperState extends State<ProfileHelper> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Image.asset(
            backgroundimage,
            fit: BoxFit.fill,
          ),
          backgroundColor: whiteColor,
          title: Text(
            'Profile',
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
                Icons.search,
                color: fontGrey,
                size: _width * 0.075,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: fontGrey,
                  size: _width * 0.07,
                ),
                onPressed: () {
                  Get.to(Cart());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: darkFontGrey,
                  ),
                  color: whiteColor,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                           Get.back();
                          },
                          child: Text(
                            setting,
                            style: styleregular(
                              _width * 0.03,
                              bluecolor,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () async {
                            await Get.put(AuthController())
                                .signOutMethod(context);
                            Get.offAll(() => LogIn());
                          },
                          child: Text(
                            logout,
                            style: styleregular(
                              _width * 0.03,
                              bluecolor,
                            ),
                          ),
                        ),
                      ),
                    ];
                  }),
            ),
            SizedBox(width: _width * 0.045),
          ],
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              var data = snapshot.data!.docs;
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 10),
                        child: Text(
                          'Account & Settings',
                        ),
                      ),
                    ),
                    buildCard('My Profile', () {
                      showAccountDialog(context);
                    }),
                    buildCard('My Cart', () {
                    Get.to(Cart());
                    }),

                  ],
                ),
              );
            }
          },
        ));
  }

  Widget buildCard(String name, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 80,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.red[900]),
      ),
      onPressed: () {
       Get.off(Meesho());
       },
    );
    Widget cancleButton = TextButton(
      child: Text(
        "Cancle",
        style: TextStyle(color: Colors.grey),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure to Logout?"),
      //content: Text("This is my message."),
      actions: [
        okButton,
        cancleButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAccountDialog(BuildContext context) {
    // set up the button

    Widget cancleButton = TextButton(
      child: Text(
        "Cancle",
        style: TextStyle(color: Colors.grey),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Your Account..."),
      content: Text(auth.currentUser!.email.toString()),
      actions: [
        cancleButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
