import 'package:flutter/material.dart';

import '../decoration/imageurl.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Container(
      height: _height,
      width: _width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundimage,
            ),
            fit: BoxFit.cover,
            opacity: 0.6,
          )),
      child: widget,
    );
  }
}
