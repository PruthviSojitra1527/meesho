import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/homepage/reainning%20area.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/commen/menu_stripe.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/imageurl.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:meesho/list/lists.dart';
import 'package:meesho/model/model%20of%20choli.dart';
import '../../authenticatioin/category_authentication.dart';
import '../../commen/searchBar.dart';
import '../../decoration/strings.dart';
import '../../model/model of kurti.dart';
import '../../model/model of sadi.dart';
import '../../model/model of western.dart';
import '../../old files/daily_deals.dart';
import '../../services/firestore_services.dart';
import '../cart/cart_page.dart';
import '../category_page/category_over_view.dart';
import '../kurti/productoverview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cat_controller = Get.put(ProductController());
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'imageUrl': kurtiList[0]['image']!,
        'imagetext': kurti_suit,
      },
      {
        'imageUrl': westernList[1]['image']!,
        'imagetext': westernWear,
      },
      {
        'imageUrl': sadiList[0]['image']!,
        'imagetext': saree,
      },
      {
        'imageUrl': choliList[0]['image']!,
        'imagetext': '$lehengas & $sharara',
      },
    ];
    var ls = [
      {
        'imageUrl': 'assets/images/kurti_image.jpg',
        'itemLabel': kurti_suit,
        'color': lightGrey,
        'widget': CategoryOverView(
          title: 'Women Dress',
          index: 1,
        ),
      },
      {
        'imageUrl': 'assets/images/westernwear_image.jpg',
        'itemLabel': westernWear,
        'color': whiteColor,
        widget: CategoryOverView(
          title: 'Women Dress',
          index: 1,
        ),
      },
      {
        'imageUrl': 'assets/images/saree_image.jpg',
        'itemLabel': saree,
        'color': whiteColor,
        'widget': CategoryOverView(
          title: 'Women Dress',
          index: 1,
        ),
      },
      {
        'imageUrl': 'assets/images/choli_image.jpg',
        'itemLabel': lehengas,
        'color': lightGrey,
        'widget': CategoryOverView(
          title: 'Women Dress',
          index: 1,
        ),
      },
    ];
    var list2 = [
      FirestoreServices.getKurtis('Women Dress'),
      FirestoreServices.getWesturn('westurn wear'),
      FirestoreServices.getSaree('sarees'),
      FirestoreServices.getLehenga('lehenga'),
    ];
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: lightGrey,
        title: Text(
          appname,
          style: stylemain(_width * 0.07, pinkcolor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              color: fontGrey,
              size: _width * 0.06,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: fontGrey,
                size: _width * 0.07,
              ),
              onPressed: () {
                Get.to(Cart());
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: BackGround(
        widget: Column(
          children: [
            SizedBox(
              height: _height * 0.015,
            ),
            SearchBar(),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Menu_Stripe(list: homepagemenustripeList),
                      SizedBox(
                        height: _height * 0.15,
                        width: _width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          itemCount: ls.length,
                          itemBuilder: (context, index) {
                            return Remainto(
                              imageUrl: ls[index]['imageUrl'].toString(),
                              itemLabel: ls[index]['itemLabel'].toString(),
                              color: ls[index]['color'] as Color,
                              widget: CategoryOverView(
                                title: ls[index]['itemLabel'].toString(),
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: CarouselSlider(
                          items: [
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG48bRA8y9x70H3eAlfpybURSkdWYRQDeioanvZHXVlJ2UAV0qo7F1j1BDWKka79HNS1E&usqp=CAU',
                            'https://images.meesho.com/images/pow/downloadBannerDesktop.webp',
                            'https://images.meesho.com/images/marketing/1678691617864.webp'
                          ]
                              .map(
                                (e) => Builder(
                                  builder: (context) => Card(
                                    elevation: 5,
                                    child: Container(
                                      height: _height * 0.3,
                                      width: _width,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: whiteColor,
                                          style: BorderStyle.solid,
                                          strokeAlign: StrokeAlign.outside,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: k_color,
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(e),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: _height * 0.2,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.easeInOutCubic,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Black055(data: dailydeals)),
                          ),
                          Container(
                            height: _height * 0.3,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              primary: false,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return DailyDeals(
                                  imageUrl: list[index]['imageUrl'].toString(),
                                  imagetext: list[index]['imagetext'].toString(),
                                  widget: CategoryOverView(
                                    title: ls[index]['itemLabel'].toString(),
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.all(8),
                          child: Text(
                            moreproduct,
                            style: stylebold(_width * 0.05, darkFontGrey),
                          )),
                      StreamBuilder(
                        stream: list2[random.nextInt(list2.length)],
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
                            print(
                                'daaaaaaaaaaaaaaaaaataaaaaaaaaaa=============== $data');
                            return Column(
                              children: [
                                // Row(
                                //   children: List.generate(
                                //       cat_controller.subcat.length,
                                //       (index) => Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //             child: Container(
                                //                 decoration: BoxDecoration(
                                //                     color: whiteColor,
                                //                     borderRadius:
                                //                         BorderRadius.circular(10),
                                //                     border: Border.all(
                                //                         color: fontGrey)),
                                //                 child: Padding(
                                //                   padding:
                                //                       const EdgeInsets.all(12.0),
                                //                   child: Text(
                                //                     '${cat_controller.subcat[index]}',
                                //                     style: stylemedium(
                                //                         _width * 0.04,
                                //                         darkFontGrey),
                                //                   ),
                                //                 )),
                                //           )),
                                // ),
                                Container(
                                  height: _height * 0.8,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
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
                                          Get.to(
                                            SafeArea(
                                              child: Scaffold(
                                                body: KurtiOverView(
                                                  index: index,
                                                  data: data[index],
                                                ),
                                              ),
                                            ),
                                          );
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 5)),
                                            child: Card(
                                                elevation: 10,
                                                color:
                                                    Colors.white.withOpacity(0.5),
                                                child: Container(
                                                  height: _height * 0.19,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
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
                                                            height:
                                                                _height * 0.045,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.black,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                cat_controller
                                                                    .addTocart(
                                                                  //title, price, tprice, selername, img, qty, context,vendorID
                                                                  img: data[index]
                                                                      [
                                                                      'k_imgs'][0],
                                                                  selername: data[
                                                                          index]
                                                                      ['k_brand'],
                                                                  title: data[
                                                                          index]
                                                                      ['k_name'],
                                                                  price: data[
                                                                          index]
                                                                      ['k_price'],
                                                                  context:
                                                                      context,
                                                                  qty: 1,
                                                                  tprice:
                                                                      cat_controller
                                                                          .totalprice
                                                                          .value,
                                                                );
                                                                print(data[index][
                                                                        'k_price']
                                                                    .toString());
                                                                print(
                                                                    'added to cart');
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
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
