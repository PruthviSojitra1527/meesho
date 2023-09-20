import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/commen/background_Container.dart';

import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/strings.dart';
import '../../decoration/textstyle.dart';
import 'add_delivery_address.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        title: Text(
          'Review your Order',
          style: stylemain(_width * 0.07, pinkcolor),
        ),
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: _width * 0.07,
          ),
        ),
      ),
      body: BackGround(
        widget: Column(
          children: [
            Container(
              height: _height * 0.05,
            ),
            Divider(
              color: fontGrey,
            ),
            Container(
              height: _height * 0.15,
            ),
            Divider(
              color: fontGrey,
            ),
            Container(
              height: _height * 0.04,
            ),
            SizedBox(
              height: _height * 0.009,
              child: Container(
                color: lightGrey,
              ),
            ),
            Container(
              color: whiteColor,
              height: _height * 0.14,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: darkFontGrey,
                          size: _width * 0.07,
                        ),
                        SizedBox(
                          width: _width * 0.03,
                        ),
                        Text('Delivery Address',
                            style: stylebold(_width * 0.04, darkFontGrey)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          shape:Border(top:BorderSide(color: lightGrey,width: _width*0.005)),
                          backgroundColor: Colors.white,
                          elevation: 3,
                          context: context,
                          builder: (context) => Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: _height * 0.03,
                                  child: Text('Select your delivery address'.toUpperCase(),
                                      style: stylebold(
                                          _width * 0.04, darkFontGrey)),
                                ),
                                Divider(
                                  color: fontGrey,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: _height * 0.05,
                                  child: TextButton(
                                    onPressed: (){
                                    Get.to(AddDeliveryAdd());
                                    },
                                    child: Text(' + ADD NEW ADDRESS',
                                        style: stylebold(
                                            _width * 0.04, pinkcolor)),
                                  ),
                                ),
                                Divider(
                                  color: fontGrey,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                 child: Text(username,
                                      style: stylebold(
                                          _width * 0.04, darkFontGrey)),
                                ),
                                SizedBox(
                                  height: _height * 0.03,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: _height * 0.05,
                                    width: _width,
                                    color: Colors.pink,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Deliver to this Address',
                                      style: stylemedium(
                                          _width * 0.05, whiteColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: _height * 0.05,
                        width: _width,
                        color: Colors.pink,
                        alignment: Alignment.center,
                        child: Text(
                          'Select Delivery Address',
                          style: stylemedium(_width * 0.05, whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height * 0.009,
              child: Container(
                color: lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
