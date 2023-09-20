import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/textstyle.dart';

Widget customButton(onpressed,String str,color,style) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(10)
    ),
      onPressed: onpressed,
      child: Text(
        str,
        style: style,
      ));
}
