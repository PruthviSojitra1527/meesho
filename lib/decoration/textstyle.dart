import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meesho/decoration/color.dart';

class Black037 extends StatelessWidget {
  const Black037({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
        fontSize: _width * 0.037,
        color: darkFontGrey,
      ),
    );
  }
}

class Black029 extends StatelessWidget {
  const Black029({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
        fontSize: _width * 0.029,
        color: blackcolor,
      ),
    );
  }
}

class Black055 extends StatelessWidget {
  const Black055({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
        fontSize: _width * 0.055,
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w700,
        color: darkFontGrey,
      ),
    );
  }
}

class White03 extends StatelessWidget {
  const White03({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
          fontSize: _width * 0.03,
          color: whiteColor,
          fontFamily: 'Oxygen',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic),
    );
  }
}

class Pink042 extends StatelessWidget {
  const Pink042({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Oxygen',
        fontWeight: FontWeight.w300,
        fontSize: _width * 0.042,
        color: darkpink,
      ),
    );
  }
}

class Black035 extends StatelessWidget {
  const Black035({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Text(
      data,
      style: TextStyle(
          fontSize: _width * 0.035,
          color: darkFontGrey,
          fontFamily: 'Oxygen',
          fontWeight: FontWeight.w400),
    );
  }
}

stylemain(fontsize,color) {
  return TextStyle(
    color: color,
    fontSize: fontsize,
    fontFamily: 'Squada One',
    fontWeight: FontWeight.w400,
  );
}

styleregular(fontsize,color) {
  return TextStyle(
      fontFamily: 'Intel',
      fontWeight: FontWeight.w300,
      fontSize: fontsize,
      color: color);
}

stylemedium(fontsize,color) {
  return TextStyle(
      fontFamily: 'Intel',
      fontWeight: FontWeight.w400,
      fontSize: fontsize,
      color: color);
}

stylebold(fontsize,color) {
  return TextStyle(
      fontFamily: 'Intel',
      fontWeight: FontWeight.w700,
      fontSize: fontsize,
      color: color,
  );
}
