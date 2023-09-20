import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class C9 extends StatefulWidget {
  const C9({Key? key}) : super(key: key);

  @override
  State<C9> createState() => _C9State();
}

class _C9State extends State<C9> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.count(
          primary: false,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92l30_6mHl_GF5310B05tbQMPaAAD_zzIQQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6mzrZRXOXLINJxKh_jbarOWYcm37vloHYBMa3a0HI2JSw8EXylqIflSl-Zw1wD05Uv0Q&usqp=CAU",
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqcNittS5vs6X-5ZSsT1gNx6vbTtBoXr89RvHKDAMgSHTJYdJtsAQaQCmASJ9S60rUZw4&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxkemzMcIB1QVKpd-DG-ooJj82DXzCGZyeGdm8CxbgGJy16CPLYIAlXLQWmi4r1Y1HA4&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkjn25z17s80b0zrqqBtLBFvjDgaIv3lYJjYt1F79jeJf0rxAPVVvkcyDMY9sdw9WkVXo&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCXbRr0BmR9VJneZwPKsW6XHaB-JDgOFDaqXXJWFk24Kw_5XU8Evm077PGMjgvwjDp42w&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh6HAFtJ2VhAbqlcatwVHz4dtV2IGC4NpkZ1MnAi3-mrkU3f9eoSQMP1UozC94rclqyts&usqp=CAU',
          ]
              .map(
                (e) => GestureDetector(
                  child: Container(
                    height: _height*0.2,
                    width: _width*0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(e),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onTap: () => Get.to(Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            e,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonBar(
                                buttonAlignedDropdown: false,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Buy Now",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
    ;
  }
}
