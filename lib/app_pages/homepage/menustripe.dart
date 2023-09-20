import 'package:flutter/material.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/strings.dart';

import '../../decoration/textstyle.dart';

class MenuStripe extends StatelessWidget {
  const MenuStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Container(
      height: _height * 0.06,
      decoration: BoxDecoration(
        color: lightGrey,
      ),
      child: GridView.count(
          crossAxisCount: 1,
          scrollDirection: Axis.horizontal,
          childAspectRatio: 0.4,
          children: [
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/shopping_bag_image.jpg',
                itemLabel: allProduct,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/women_icon.jpg',
                itemLabel:women,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/men_image.jpg',
                itemLabel: men,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/kids_image.jpg',
                itemLabel: kids,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/electronics_image.jpg',
                itemLabel:electonics,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: MenuScripeItem(
                imageUrl: 'assets/images/kitchen_image.jpg',
                itemLabel:kitchen,
              ),
            ),
          ]),
    );
  }
}

class MenuScripeItem extends StatelessWidget {
  const MenuScripeItem(
      {Key? key, required this.imageUrl, required this.itemLabel})
      : super(key: key);
  final String imageUrl;
  final String itemLabel;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Container(
      child: Row(
        children: [
          Container(
            height: _height*0.04,
            width:_height*0.04,
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: _width*0.01,
          ),
          Expanded(
            child: Black037(data: itemLabel,),
          ),
        ],
      ),
    );
  }
}