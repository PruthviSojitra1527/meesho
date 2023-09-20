import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/commen/background_Container.dart';
import '../../decoration/textstyle.dart';
import '../../model/model of kurti.dart';
import 'productoverview.dart';

class Kurti extends StatelessWidget {
  const Kurti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return BackGround(
      widget:  Padding(
        padding: const EdgeInsets.all(3.0),
        child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 0.6,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            children: List.generate(
              kurtiList.length,
              (index) => GestureDetector(
                onTap: () {
                  Get.to(SafeArea(
                    child: Scaffold(
                      body: KurtiOverView(
                        index: index,
                      ),
                    ),
                  ),);
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(kurtiList[index]['image']!),
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
                                Black037(data: '${kurtiList[index]['title']!}'),
                                Black055(
                                    data: '${kurtiList[index]['price']!}/-'),
                                Card(
                                    elevation: 15,
                                    color: Colors.black,
                                    child: TextButton(
                                      onPressed: () {
                                        showBottomSheet(
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (context) => Container(
                                            margin: EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: _height * 0.05,
                                                ),
                                                Container(
                                                  height: _height * 0.05,
                                                  alignment: Alignment.topLeft,
                                                  child: Black035(
                                                    data: 'Select Size',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: _height * 0.0003,
                                                ),
                                                Divider(
                                                  height: _height * 0.059,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  height: _height * 0.0003,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Black037(data: 'Select Return Type'),
                                                ),
                                                SizedBox(
                                                  height: _height * 0.03,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        height: _width * 0.4,
                                                        width: _width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[100],
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(10),
                                                          ),
                                                          border: Border.all(color: Colors.pink),
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: Black055(
                                                          data: kurtiList[index]['price']!,
                                                        ),
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        height: _width * 0.4,
                                                        width: _width * 0.4,
                                                        color: Colors.grey[100],
                                                        alignment: Alignment.center,
                                                        child: Black055(
                                                          data:
                                                          '${kurtiList[index]['price']!}',
                                                        ),
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: _height * 0.03,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: _height * 0.05,
                                                    width: _width,
                                                    color: Colors.pink,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Add To Cart',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: _width * 0.05,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
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
      ),
    );
  }
}
