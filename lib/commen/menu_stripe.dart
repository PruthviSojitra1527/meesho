import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../decoration/color.dart';
import '../decoration/textstyle.dart';
import '../list/lists.dart';

class Menu_Stripe extends StatelessWidget {
  const Menu_Stripe({Key? key, required this.list}) : super(key: key);
final List list;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          list.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                list[index],
                style: stylemedium(_width * 0.04, darkFontGrey),
              ),
            )
                .box
                .rounded
                .white
                .size(_width * 0.3, _height * 0.07)
                .margin(EdgeInsets.all(8))
                .make(),
          ),
        ),
      ),
    );
  }
}
