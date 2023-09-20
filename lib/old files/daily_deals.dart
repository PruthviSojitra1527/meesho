import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/decoration/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../decoration/textstyle.dart';

class DailyDeals extends StatelessWidget {
  const DailyDeals(
      {Key? key,
      required this.imageUrl,
      required this.imagetext,
      required this.widget})
      : super(key: key);
  final String imageUrl;
  final String imagetext;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return GestureDetector(
      child: Column(
        children: [
          Card(
            elevation: 10,
            child: Container(
              height: _height * 0.235,
              width: _width * 0.4,
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                width: _width * 0.4,
                height: _height * 0.235,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(imagetext,
                  style: stylemedium(_width * 0.04, darkFontGrey))),
        ],
      ).box.white.roundedSM.make(),
      onTap: () => Get.to(widget),
    );
  }
}
//
