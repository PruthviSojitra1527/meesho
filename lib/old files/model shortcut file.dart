
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../decoration/textstyle.dart';

class ShortcutOfModel extends StatelessWidget {
  final List<Map> imageUrl;
  final Widget widget;

  final  String imagetitle;

  final String imageprice;

  final String imagesize;
  const ShortcutOfModel({Key? key, required this.widget, required this.imageUrl, required this.imagetitle, required this.imageprice, required this.imagesize}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          childAspectRatio: 0.6,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          children: List.generate(
            imageUrl.length,
                (index) => GestureDetector(
              onTap: () {
              Get.to(widget);
              },
              child: Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl[index]['image']),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 5)),
                  child: Card(
                      elevation: 10,
                      color: Colors.white.withOpacity(0.5),
                      child: Container(
                        height: _height * 0.19,
                        width: _width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Black037(data: '${imagetitle}'),
                              Black055(
                                  data: '${imageprice}/-'),
                              Black037(
                                  data:
                                  'with ${imagesize} size'),
                              Card(
                                  elevation: 15,
                                  color: Colors.black,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: White03(data: 'ADD TO CART'),
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          )),
    );
  }
}