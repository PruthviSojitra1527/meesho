import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class C8 extends StatefulWidget {
  const C8({Key? key}) : super(key: key);

  @override
  State<C8> createState() => _C8State();
}

class _C8State extends State<C8> {
  List ls = [450, 500, 300, 255, 660, 980, 120];

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
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Wj2mQjemRLwQjZcNngpihAYAQ4bi-VSKDA&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5u_nttoICsEMklF55qIQ_stBYcfGNyJ9sygtoQeFCXHkc2VffK4Va49DySbbVOTFCr_o&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiBNOR7z7ObpG01SzOCDP5D2X1UlLUkn-LxCWGr-wLDIl_KDAlr_ZmEXOGcs__0SJf3oQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnpbAYTHRfQvtoqzrVmSa0yK-K8qz5f8WVt9disjm6zco5YRfBXey3_9OgTkqBwyFV0P8&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV9Cz-S2j965a1J8nNoSNKFS1DByXS1-EiOxjqQ5-3EAI6-z5holuC48X5mp4ywY4YhQs&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZfYmHNNZJsoy_sxEAw60ZiIMBclWF7Nl5IgrbojN77r2taWmIMe49NQYBVbWTyaRi774&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCsQ4OVvSMiA-U3p1qhxz0_Fx9NNHR0c-ndWGTgQRLAs4nMu7QtyZqFqTdpXvsgpERpTI&usqp=CAU",
          ]
              .map(
                (e) => GestureDetector(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        Expanded(child: Image.network(e)),
                        Text("price Rs.${ls[0]}")
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
  }
}
