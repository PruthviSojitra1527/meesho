import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class C10 extends StatefulWidget {
  const C10({Key? key}) : super(key: key);

  @override
  State<C10> createState() => _C10State();
}

class _C10State extends State<C10> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.count(
          primary: false,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbcRQjnDHFVygzw296VC-DXccC06FgePzYQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThz7GhUo_eoQl_6WK6tidSWjoqN3dh3EMBHxmiYT6aFGghd5Ccotscd21ufxlgNCyqMn0&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGjWLazBtK9ZXx_RwD5TJ8LeWwUaKA223CPBfNKLTGLFethh5yLo3f9srMBz9a9JMwuS0&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEXbCziFlntNGyPIJbgC2Jze6inZy019d6Dbr0lbGHm_FdGvGVfAhVPn4yP_8vJBttbNo&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu9joL2EKX62XjgeaHhiypkpOYTsRSHASu89mVnQxJ6X6631-n1EmiCPeDpDZKJC2Cb5s&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVD8to_rvVXFLmodgufGtX2fZ8nDpuy_1WVHuXEF-f7a44tuMyx_pr7IwSv9Qd7KGACy0&usqp=CAU",
          ]
              .map(
                (e) => GestureDetector(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        Expanded(child: Image.network(e)),
                        // Text("price Rs.${ls[0]}")
                      ],
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
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonBar(
                                buttonAlignedDropdown: false,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                          "Cotton kurti with comfertable length"),
                                      SizedBox(height:20),
                                      Row(children: [
                                        Text(
                                          "Rs.430",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        Text("12% off"),
                                      ])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: ButtonStyle(),
                                      ),
                                      SizedBox(
                                        width: 5,
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Buy Now",
                                          style: TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  )
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
