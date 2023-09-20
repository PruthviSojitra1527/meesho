import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/strings.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextfield(
    {
  required String str,
  required String hintstr,
  required double fontsize,
  required TextEditingController controller,
      required bool ispass,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      str.text.color(pinkcolor).fontFamily('Oxygen').fontWeight(FontWeight.w400).size(fontsize).make(),
      TextFormField(
        obscureText: ispass,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintstr,
          isDense:true,
          fillColor: lightGrey,
          filled: true,
          border:OutlineInputBorder(borderSide: BorderSide(color: fontGrey)),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: redcolor)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: pinkcolor))
        )
      ),
      SizedBox(height: fontsize,)
    ],
  );
}