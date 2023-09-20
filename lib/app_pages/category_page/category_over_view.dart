import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/authenticatioin/category_authentication.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/decoration/strings.dart';
import 'package:meesho/services/firestore_services.dart';
import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/textstyle.dart';
import '../kurti/productoverview.dart';

class CategoryOverView extends StatelessWidget {
  CategoryOverView({Key? key, required this.title, required this.index}) : super(key: key);
  final String title;
  final int index;
  var cat_controller = Get.put<ProductController>(ProductController());

  @override
  Widget build(BuildContext context) {
    var ls =[
      FirestoreServices.getKurtis('Women Dress'),
      FirestoreServices.getWesturn('westurn wear'),
      FirestoreServices.getSaree('sarees'),
      FirestoreServices.getLehenga('lehenga'),

    ];
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return WillPopScope(
      onWillPop: () async {
        await cat_controller.resetValue();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Image.asset(
            backgroundimage,
            fit: BoxFit.fill,
          ),
          backgroundColor: whiteColor,
          title: Text(
            title,
            style: stylemain(_width * 0.07, pinkcolor),
          ),
          leading: IconButton(
            color: darkFontGrey,
            onPressed: () {
              cat_controller.resetValue();
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              size: _width * 0.07,
            ),
          ),
        ),
        body: BackGround(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: ls[index],
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                print("data+++++++++++   ${snapshot.data}");
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No Products Found!'),
                  );
                } else {
                  var data = snapshot.data!.docs;
                  print('daaaaaaaaaaaaaaaaaataaaaaaaaaaa=============== $data');
                  return Container(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                cat_controller.subcat.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border:
                                                  Border.all(color: fontGrey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              '${cat_controller.subcat[index]}',
                                              style: stylemedium(
                                                  _width * 0.04, darkFontGrey),
                                            ),
                                          )),
                                    )),
                          ),
                        ),
                        Container(
                          height: _height * 0.8,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                              mainAxisExtent: _height * 0.4,
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  cat_controller.checkIfFav(data[index]);
                                 Get.to(SafeArea(
                                   child: Scaffold(
                                     body: KurtiOverView(
                                       index: index,
                                       data: data[index],
                                     ),
                                   ),
                                 ),);
                                },
                                child: Center(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              data[index]['k_imgs'][0]),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white, width: 5)),
                                    child: Card(
                                        elevation: 10,
                                        color: Colors.white.withOpacity(0.5),
                                        child: Container(
                                          height: _height * 0.19,
                                          width: _width * 0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Black037(
                                                    data:
                                                        '${data[index]['k_productCode']}'),
                                                Expanded(
                                                  child: Text(
                                                    '${data[index]['k_price']}',
                                                    style: stylebold(
                                                        _width * 0.04,
                                                        darkFontGrey),
                                                  ),
                                                ),
                                                Container(
                                                    height: _height * 0.045,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        cat_controller
                                                            .addTocart(//title, price, tprice, selername, img, qty, context,vendorID
                                                          img: data[index]['k_imgs'][0],
                                                          selername: data[index]['k_brand'],
                                                          title: data[index]
                                                              ['k_name'],
                                                          price: data[index]
                                                              ['k_price'],
                                                          context: context,
                                                          qty:1,
                                                          tprice: cat_controller
                                                              .totalprice.value,
                                                        );
                                                        print(data[index]
                                                                ['k_price']
                                                            .toString());
                                                        print('added to cart');
                                                      },
                                                      // onPressed: () {
                                                      //   showBottomSheet(
                                                      //     backgroundColor: Colors
                                                      //         .white,
                                                      //     context: context,
                                                      //     builder: (context) =>
                                                      //         Container(
                                                      //           margin: EdgeInsets
                                                      //               .all(10),
                                                      //           child: Column(
                                                      //             mainAxisSize: MainAxisSize
                                                      //                 .min,
                                                      //             children: [
                                                      //               SizedBox(
                                                      //                 height: _height *
                                                      //                     0.05,
                                                      //               ),
                                                      //               Container(
                                                      //                 height: _height *
                                                      //                     0.05,
                                                      //                 alignment: Alignment
                                                      //                     .topLeft,
                                                      //                 child: Black035(
                                                      //                   data: 'Select Size',
                                                      //                 ),
                                                      //               ),
                                                      //               SizedBox(
                                                      //                 height: _height *
                                                      //                     0.0003,
                                                      //               ),
                                                      //               MySize(data,
                                                      //                   index),
                                                      //               Divider(
                                                      //                 height: _height *
                                                      //                     0.059,
                                                      //                 color: Colors
                                                      //                     .black,
                                                      //               ),
                                                      //               SizedBox(
                                                      //                 height: _height *
                                                      //                     0.0003,
                                                      //               ),
                                                      //               Container(
                                                      //                 alignment: Alignment
                                                      //                     .topLeft,
                                                      //                 child: Black037(
                                                      //                     data: 'Select Return Type'),
                                                      //               ),
                                                      //               SizedBox(
                                                      //                 height: _height *
                                                      //                     0.03,
                                                      //               ),
                                                      //               Row(
                                                      //                 mainAxisAlignment: MainAxisAlignment
                                                      //                     .spaceEvenly,
                                                      //                 children: [
                                                      //                   GestureDetector(
                                                      //                     child: Container(
                                                      //                       height: _width *
                                                      //                           0.4,
                                                      //                       width: _width *
                                                      //                           0.4,
                                                      //                       decoration: BoxDecoration(
                                                      //                         color: Colors
                                                      //                             .grey[100],
                                                      //                         borderRadius: BorderRadius
                                                      //                             .all(
                                                      //                           Radius
                                                      //                               .circular(
                                                      //                               10),
                                                      //                         ),
                                                      //                         border: Border
                                                      //                             .all(
                                                      //                             color: Colors
                                                      //                                 .pink),
                                                      //                       ),
                                                      //                       alignment: Alignment
                                                      //                           .center,
                                                      //                       // child: Black055(
                                                      //                       //   data:
                                                      //                       //   '${data[index]['k_price'] }',
                                                      //                       // ),
                                                      //                     ),
                                                      //                     onTap: () {},
                                                      //                   ),
                                                      //                   GestureDetector(
                                                      //                     child: Container(
                                                      //                       height: _width *
                                                      //                           0.4,
                                                      //                       width: _width *
                                                      //                           0.4,
                                                      //                       color: Colors
                                                      //                           .grey[100],
                                                      //                       alignment: Alignment
                                                      //                           .center,
                                                      //                       // child: Black055(
                                                      //                       //   data:
                                                      //                       //   '${data[index]['k_price'] }',
                                                      //                       // ),
                                                      //                     ),
                                                      //                     onTap: () {},
                                                      //                   ),
                                                      //                 ],
                                                      //               ),
                                                      //               SizedBox(
                                                      //                 height: _height *
                                                      //                     0.03,
                                                      //               ),
                                                      //               GestureDetector(
                                                      //                 onTap: () {},
                                                      //                 child: Container(
                                                      //                   height: _height *
                                                      //                       0.05,
                                                      //                   width: _width,
                                                      //                   color: Colors
                                                      //                       .pink,
                                                      //                   alignment: Alignment
                                                      //                       .center,
                                                      //                   child: Text(
                                                      //                     addtocart,
                                                      //                     style: TextStyle(
                                                      //                       color: Colors
                                                      //                           .white,
                                                      //                       fontSize: _width *
                                                      //                           0.05,
                                                      //                     ),
                                                      //                   ),
                                                      //                 ),
                                                      //               ),
                                                      //             ],
                                                      //           ),
                                                      //         ),
                                                      //   );
                                                      // },
                                                      child: White03(
                                                        data: addtocart,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              );
                            },
                          ),
                          //   child: SingleChildScrollView(
                          //       scrollDirection: Axis.vertical,
                          //       // child: GridView.count(
                          //       // crossAxisCount: 2,
                          //       // scrollDirection: Axis.vertical,
                          //       // childAspectRatio: 0.6,
                          //       // crossAxisSpacing: 3,
                          //       // mainAxisSpacing: 3,
                          //       // children: List.generate(
                          //       //   data.length,
                          //       //       (index) => GestureDetector(
                          //       //     onTap: () {
                          //       //       Navigator.push(
                          //       //           context,
                          //       //           MaterialPageRoute(
                          //       //             builder: (context) => SafeArea(
                          //       //               child: Scaffold(
                          //       //                 body: KurtiOverView(
                          //       //                   index: index,
                          //       //                 ),
                          //       //               ),
                          //       //             ),
                          //       //           ));
                          //       //     },
                          //       //     child: Center(
                          //       //       child: Container(
                          //       //         alignment: Alignment.bottomCenter,
                          //       //         decoration: BoxDecoration(
                          //       //             image: DecorationImage(
                          //       //               image: NetworkImage(data[index]['k_imgs'][0]),
                          //       //               fit: BoxFit.cover,
                          //       //             ),
                          //       //             color: Colors.white,
                          //       //             borderRadius: BorderRadius.circular(10),
                          //       //             border: Border.all(color: Colors.white, width: 5)),
                          //       //         child: Card(
                          //       //             elevation: 10,
                          //       //             color: Colors.white.withOpacity(0.5),
                          //       //             child: Container(
                          //       //               height: _height * 0.19,
                          //       //               width: _width * 0.4,
                          //       //               decoration: BoxDecoration(
                          //       //                 borderRadius: BorderRadius.circular(10),
                          //       //                 color: Colors.white.withOpacity(0.5),
                          //       //               ),
                          //       //               child: Padding(
                          //       //                 padding: const EdgeInsets.all(8.0),
                          //       //                 child: Column(
                          //       //                   mainAxisAlignment: MainAxisAlignment.start,
                          //       //                   children: [
                          //       //                     Black037(data: '${data[index]['k_productCode']}'),
                          //       //                     Black055(
                          //       //                         data: '${data[index]['k_price']}'),
                          //       //                     Card(
                          //       //                         elevation: 15,
                          //       //                         color: Colors.black,
                          //       //                         child: TextButton(
                          //       //                           onPressed: () {
                          //       //                             showBottomSheet(
                          //       //                               backgroundColor: Colors.white,
                          //       //                               context: context,
                          //       //                               builder: (context) => Container(
                          //       //                                 margin: EdgeInsets.all(10),
                          //       //                                 child: Column(
                          //       //                                   mainAxisSize: MainAxisSize.min,
                          //       //                                   children: [
                          //       //                                     SizedBox(
                          //       //                                       height: _height * 0.05,
                          //       //                                     ),
                          //       //                                     Container(
                          //       //                                       height: _height * 0.05,
                          //       //                                       alignment: Alignment.topLeft,
                          //       //                                       child: Black035(
                          //       //                                         data: 'Select Size',
                          //       //                                       ),
                          //       //                                     ),
                          //       //                                     SizedBox(
                          //       //                                       height: _height * 0.0003,
                          //       //                                     ),
                          //       //                                     MySize(),
                          //       //                                     Divider(
                          //       //                                       height: _height * 0.059,
                          //       //                                       color: Colors.black,
                          //       //                                     ),
                          //       //                                     SizedBox(
                          //       //                                       height: _height * 0.0003,
                          //       //                                     ),
                          //       //                                     Container(
                          //       //                                       alignment: Alignment.topLeft,
                          //       //                                       child: Black037(data: 'Select Return Type'),
                          //       //                                     ),
                          //       //                                     SizedBox(
                          //       //                                       height: _height * 0.03,
                          //       //                                     ),
                          //       //                                     Row(
                          //       //                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //       //                                       children: [
                          //       //                                         GestureDetector(
                          //       //                                           child: Container(
                          //       //                                             height: _width * 0.4,
                          //       //                                             width: _width * 0.4,
                          //       //                                             decoration: BoxDecoration(
                          //       //                                               color: Colors.grey[100],
                          //       //                                               borderRadius: BorderRadius.all(
                          //       //                                                 Radius.circular(10),
                          //       //                                               ),
                          //       //                                               border: Border.all(color: Colors.pink),
                          //       //                                             ),
                          //       //                                             alignment: Alignment.center,
                          //       //                                             child: Black055(
                          //       //                                               data: data[index]['k_price'],
                          //       //                                             ),
                          //       //                                           ),
                          //       //                                           onTap: () {},
                          //       //                                         ),
                          //       //                                         GestureDetector(
                          //       //                                           child: Container(
                          //       //                                             height: _width * 0.4,
                          //       //                                             width: _width * 0.4,
                          //       //                                             color: Colors.grey[100],
                          //       //                                             alignment: Alignment.center,
                          //       //                                             child: Black055(
                          //       //                                               data:
                          //       //                                               '${data[index]['k_price'] }',
                          //       //                                             ),
                          //       //                                           ),
                          //       //                                           onTap: () {},
                          //       //                                         ),
                          //       //                                       ],
                          //       //                                     ),
                          //       //                                     SizedBox(
                          //       //                                       height: _height * 0.03,
                          //       //                                     ),
                          //       //                                     GestureDetector(
                          //       //                                       onTap: () {},
                          //       //                                       child: Container(
                          //       //                                         height: _height * 0.05,
                          //       //                                         width: _width,
                          //       //                                         color: Colors.pink,
                          //       //                                         alignment: Alignment.center,
                          //       //                                         child: Text(
                          //       //                                           'Add To Cart',
                          //       //                                           style: TextStyle(
                          //       //                                             color: Colors.white,
                          //       //                                             fontSize: _width * 0.05,
                          //       //                                           ),
                          //       //                                         ),
                          //       //                                       ),
                          //       //                                     ),
                          //       //                                   ],
                          //       //                                 ),
                          //       //                               ),
                          //       //                             );
                          //       //                           },
                          //       //                           child: White03(data: 'ADD TO CART'),
                          //       //                         ))
                          //       //                   ],
                          //       //                 ),
                          //       //               ),
                          //       //             )),
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ))),
                          // ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
