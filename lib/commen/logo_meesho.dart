import 'package:flutter/cupertino.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/textstyle.dart';

import '../decoration/strings.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Center(
      child: Container(
        alignment: Alignment.center,
        height: _height * 0.1,
        width: _width,
        decoration: BoxDecoration(
          color: k_color,
        ),
        child: Text(
          appname,
          style: stylemain(_width*0.15,pinkcolor)
        ),
      ),
    );
  }
}
