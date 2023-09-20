import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../decoration/color.dart';
import '../../decoration/textstyle.dart';


Widget DetailsCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        count!,
        style: styleregular(
          width * 0.03,
          bluecolor,
        ),
      ),
      SizedBox(
        height: width * 0.01,
      ),
      Text(
        title!,
        style: styleregular(
          width * 0.03,
          bluecolor,
        ),
      ),
    ],
  )
      .box
      .white
      .rounded
      .width(width * 0.01)
      .height(width * 0.01)
      .padding(EdgeInsets.all(8))
      .make();
}
