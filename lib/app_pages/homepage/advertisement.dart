import 'package:flutter/material.dart';

import '../../decoration/color.dart';


class Adverticement extends StatelessWidget {
  const Adverticement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return  Container(
      height: _height*0.2,
      width: _width,
      color: k_color,
    );
  }
}

