import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:meesho/app_pages/homepage/home%20tab%20page.dart';
import '../../decoration/color.dart';
import '../kurti/kurti.dart';
import 'advertisement.dart';

class RemainingArea extends StatelessWidget {
  const RemainingArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: k_color,
            height: _height * 0.1,
            width: _width,
          ),
          Container(
            color: Colors.purple[100],
            height: _height * 0.06,
            width: _width,
          ),
          Container(
            height: _height * 0.125,
            width: _width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Remainto(imageUrl: 'assets/images/category_image.png', itemLabel: 'Categories', color: Colors.white, widget: HomePage(),),
                  Remainto(imageUrl: 'assets/images/kurti_image.jpg', itemLabel: 'Kurti & Suit', color:k_color, widget: Kurti(),),
                  Remainto(imageUrl: 'assets/images/westernwear_image.jpg', itemLabel: 'Westernwear', color: Colors.white, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/mall_image.png', itemLabel: 'Mall', color: Colors.white, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/menwear_image.jpg', itemLabel: 'Men', color: Colors.white, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/kidswear_image.jpg', itemLabel: 'Kids', color: k_color, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/saree_image.jpg', itemLabel: 'Saree', color: Colors.white, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/jwellery_image.jpg', itemLabel: 'Jwellery', color: Colors.white, widget: Scaffold(),),
                  Remainto(imageUrl: 'assets/images/choli_image.jpg', itemLabel: 'Lehengas', color:k_color, widget: Scaffold(),),
                ],
              ),
            ),
          ),

          Adverticement(),
          SizedBox(
            height: 5,
          ),
          Container(color: Colors.pink[200],height: _height*0.1,width: _width,),
          Container(color: Colors.blue[200],height: 100,width: double.maxFinite,),
          Container(color: Colors.pink[200],height: 100,width: double.maxFinite,),
          Container(color: Colors.blue[200],height: 100,width: double.maxFinite,),
        ],
      ),
    );
  }
}

class RemainingAreaItem extends StatelessWidget {
  const RemainingAreaItem(
      {Key? key, required this.imageUrl, required this.itemLabel, required this.color})
      : super(key: key);
  final String imageUrl;
  final String itemLabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Container(
      height: _height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: _height * 0.09,
            width: _height * 0.09,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.circle,
              color:color,
              border: Border.all(color:k_color),
            ),
          ),
          Black037( data:itemLabel,),
        ],
      ),
    );
  }
}
class Remainto extends StatelessWidget {


  const Remainto({Key? key, required this.imageUrl, required this.itemLabel, required this.color, required this.widget}) : super(key: key);
  final String imageUrl;
  final String itemLabel;
  final Color color;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
         Get.to(widget);
          },
        child: RemainingAreaItem(
          imageUrl: imageUrl,
          itemLabel: itemLabel, color: color,),),
    );
  }
}
