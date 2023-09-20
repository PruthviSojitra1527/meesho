import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/category_page/category_over_view.dart';
import 'package:meesho/app_pages/kurti/kurti.dart';
import 'package:meesho/commen/button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../authenticatioin/category_authentication.dart';
import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/strings.dart';
import '../../decoration/textstyle.dart';
import '../../list/lists.dart';
import '../../services/firestore_services.dart';
import '../cart/cart_page.dart';
import 'package:http/http.dart' as http;

class KurtiOverView extends StatefulWidget {
  KurtiOverView({Key? key, required this.index, this.data}) : super(key: key);
  final int index;
  final dynamic data;

  @override
  State<KurtiOverView> createState() => _KurtiOverViewState();
}

class _KurtiOverViewState extends State<KurtiOverView> {
  var controller = Get.find<ProductController>();

  payment_success() {
    VxToast.show(context, msg: "payment successfully done....");
    print("payment successfully done....");
  }

  payment_error() {
    VxToast.show(context, msg: "payment error.....");
    print("payment error.....");
  }

  payment(cart_controller) {
    var options = {
      'key': 'rzp_test_U5fKj454uoyfBg',
      'amount': num.parse(controller.totalprice.value.toString()) * 100,
      'name': 'pruthvi',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '7405344474',
        'email': 'pruthvisojitra358@gmail.com',
      }
    };
    try {
      razorpay!.open(options);
    } catch (error) {
      VxToast.show(context, msg: "errorrr in razorpay:$error");
      print("errorrr in razorpay:$error");
    }
  }

  Razorpay? razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, payment_success);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, payment_error);
  }

  int i = 0;

  var more_details = 'More Details';

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    var ls = [
      FirestoreServices.getKurtis('Women Dress'),
      FirestoreServices.getWesturn('westurn wear'),
      FirestoreServices.getSaree('sarees'),
      FirestoreServices.getLehenga('lehenga'),
    ];

    var cat_controller = Get.find<ProductController>();
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
//     return ListView(
//       children: [
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               SadiImage(
//                 imageUrl: kurtiList[widget.index]['image']!,
//               ),
//               SadiImage(
//                 imageUrl: kurtiList[widget.index]['image type 1']!,
//               ),
//               SadiImage(
//                 imageUrl: kurtiList[widget.index]['image type 2']!,
//               ),
//               SadiImage(
//                 imageUrl: kurtiList[widget.index]['image type 3']!,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Black037(data: kurtiList[widget.index]['title']!),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.favorite_border,
//                     color: Colors.grey[500],
//                   ),
//                   Black029(data: 'WishList'),
//                 ],
//               ),
//             ),
//             SizedBox(width: 8),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.share_outlined),
//                     color: Colors.grey[500],
//                     onPressed: () async {
//                       final uri = Uri.parse(kurtiList[widget.index]['image']!);
//                       final res = await http.get(uri);
//                       final bytes = res.bodyBytes;
//                       final temp = await getTemporaryDirectory();
//                       final path = '${temp.path}/image.jpg';
//                       File(path).writeAsBytesSync(bytes);
//                       await Share.shareFiles([path],
//                           text: kurtiList[widget.index]['image']);
//                     },
//                   ),
//                   Black029(data: 'Share')
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Black055(data: kurtiList[widget.index]['price']!),
//               SizedBox(
//                 width: 3,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Icon(
//                   Icons.info_outline,
//                   color: Colors.grey[500],
//                   size: 15,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             alignment: Alignment.topLeft,
//             decoration: BoxDecoration(
//                 color: Colors.pink[100],
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     alignment: Alignment.topLeft,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Pink042(
//                             data:
//                                 '${kurtiList[widget.index]['price']} With 1 Special Offer '),
//                         SizedBox(
//                           width: _width * 0.05,
//                         ),
//                         Container(
//                             decoration: BoxDecoration(
//                               color: Colors.pink[200],
//                               shape: BoxShape.circle,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Colors.pink,
//                                 size: 20,
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 color: Colors.grey[100]),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Black037(
//                 data: 'Free Delivery',
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Container(
//           height: _height * 0.15,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   alignment: Alignment.topLeft,
//                   child: Black055(data: 'Select Size')),
//               SizedBox(
//                 height: 10,
//               ),
//               MySize()
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: _height * 0.1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   child: Container(
//                     height: _height * 0.05,
//                     width: _width * 0.45,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                       border: Border.all(
//                           color: Colors.black, width: _width * 0.002),
//                     ),
//                     child: Text(
//                       'Add To Cart',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: _width * 0.04,
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     showBottomSheet(
//                       backgroundColor: Colors.white,
//                       context: context,
//                       builder: (context) => Container(
//                         margin: EdgeInsets.all(10),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: _height * 0.05,
//                             ),
//                             Container(
//                               height: _height * 0.05,
//                               alignment: Alignment.topLeft,
//                               child: Black035(
//                                 data: 'Select Size',
//                               ),
//                             ),
//                             SizedBox(
//                               height: _height * 0.0003,
//                             ),
//                             MySize(),
//                             Divider(
//                               height: _height * 0.059,
//                               color: Colors.black,
//                             ),
//                             SizedBox(
//                               height: _height * 0.0003,
//                             ),
//                             Container(
//                               alignment: Alignment.topLeft,
//                               child: Black037(data: 'Select Return Type'),
//                             ),
//                             SizedBox(
//                               height: _height * 0.03,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 GestureDetector(
//                                   child: Container(
//                                     height: _width * 0.4,
//                                     width: _width * 0.4,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey[100],
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(10),
//                                       ),
//                                       border: Border.all(color: Colors.pink),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Black055(
//                                       data: kurtiList[widget.index]['price']!,
//                                     ),
//                                   ),
//                                   onTap: () {},
//                                 ),
//                                 GestureDetector(
//                                   child: Container(
//                                     height: _width * 0.4,
//                                     width: _width * 0.4,
//                                     color: Colors.grey[100],
//                                     alignment: Alignment.center,
//                                     child: Black055(
//                                       data:
//                                           '${kurtiList[widget.index]['price']!}',
//                                     ),
//                                   ),
//                                   onTap: () {},
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: _height * 0.03,
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 height: _height * 0.05,
//                                 width: _width,
//                                 color: Colors.pink,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'Add To Cart',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: _width * 0.05,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 GestureDetector(
//                   child: Container(
//                     height: _height * 0.05,
//                     width: _width * 0.45,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Colors.pink,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                       border: Border.all(color: Colors.black, width: 1),
//                     ),
//                     child: Text(
//                       'Buy Now',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: _width * 0.05,
//                       ),
//                     ),
//                   ),
//                   onTap: () {},
//                 )
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       alignment: Alignment.topLeft,
//                       child: Black055(data: 'Product Details'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Container(
//                   alignment: Alignment.topLeft,
//                   child: Black037(
//                     data: '''
// Name : women kurta
// Fabric : Rayon
// Sleeve Length : Three-Quarter Sleeves
// Pattern : Printed
// Combo of : Single
// Sizes : S, M, L, XL, XXL, XXXL
// Country of Origin : India''',
//                   ),
//                 ),
//                 Container(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         more_details = shiping_and_policy;
//                       });
//                     },
//                     child: Black037(
//                       data: more_details,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Black055(data: 'More Products'),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListView(
//                     shrinkWrap: true,
//                     primary: false,
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       Column(
//                         children: List.generate(
//                           kurtiList.length,
//                           (index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MaterialApp(
//                                       home: Scaffold(
//                                         body: KurtiOverView(
//                                           index: index,
//                                         ),
//                                       ),
//                                     ),
//                                   ));
//                             },
//                             child: Center(
//                               child: Container(
//                                 width: _width,
//                                 height: _height * 0.7,
//                                 alignment: Alignment.bottomCenter,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                           kurtiList[index]['image']!),
//                                       fit: BoxFit.cover,
//                                     ),
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Colors.white, width: 5)),
//                                 child: Card(
//                                   elevation: 10,
//                                   color: Colors.white.withOpacity(0.5),
//                                   child: Container(
//                                     height: _height * 0.19,
//                                     width: _width * 0.4,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white.withOpacity(0.5),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Black037(
//                                               data:
//                                                   '${kurtiList[index]['title']!}'),
//                                           Black055(
//                                               data:
//                                                   '${kurtiList[index]['price']!}/-'),
//                                           GestureDetector(
//                                             onTap: () {
//                                               showBottomSheet(
//                                                 backgroundColor: Colors.white,
//                                                 context: context,
//                                                 builder: (context) => Container(
//                                                   margin: EdgeInsets.all(10),
//                                                   child: Column(
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     children: [
//                                                       SizedBox(
//                                                         height: _height * 0.05,
//                                                       ),
//                                                       Container(
//                                                         height: _height * 0.05,
//                                                         alignment:
//                                                             Alignment.topLeft,
//                                                         child: Black035(
//                                                           data: 'Select Size',
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height:
//                                                             _height * 0.0003,
//                                                       ),
//                                                       MySize(),
//                                                       Divider(
//                                                         height: _height * 0.059,
//                                                         color: Colors.black,
//                                                       ),
//                                                       SizedBox(
//                                                         height:
//                                                             _height * 0.0003,
//                                                       ),
//                                                       Container(
//                                                         alignment:
//                                                             Alignment.topLeft,
//                                                         child: Black037(
//                                                             data:
//                                                                 'Select Return Type'),
//                                                       ),
//                                                       SizedBox(
//                                                         height: _height * 0.03,
//                                                       ),
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           GestureDetector(
//                                                             child: Container(
//                                                               height:
//                                                                   _width * 0.4,
//                                                               width:
//                                                                   _width * 0.4,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: Colors
//                                                                     .grey[100],
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .all(
//                                                                   Radius
//                                                                       .circular(
//                                                                           10),
//                                                                 ),
//                                                                 border: Border.all(
//                                                                     color: Colors
//                                                                         .pink),
//                                                               ),
//                                                               alignment:
//                                                                   Alignment
//                                                                       .center,
//                                                               child: Black055(
//                                                                 data: kurtiList[
//                                                                         widget
//                                                                             .index]
//                                                                     ['price']!,
//                                                               ),
//                                                             ),
//                                                             onTap: () {},
//                                                           ),
//                                                           GestureDetector(
//                                                             child: Container(
//                                                               height:
//                                                                   _width * 0.4,
//                                                               width:
//                                                                   _width * 0.4,
//                                                               color: Colors
//                                                                   .grey[100],
//                                                               alignment:
//                                                                   Alignment
//                                                                       .center,
//                                                               child: Black055(
//                                                                 data:
//                                                                     '${kurtiList[widget.index]['price']!}',
//                                                               ),
//                                                             ),
//                                                             onTap: () {},
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       SizedBox(
//                                                         height: _height * 0.03,
//                                                       ),
//                                                       GestureDetector(
//                                                         onTap: () {},
//                                                         child: Container(
//                                                           height:
//                                                               _height * 0.05,
//                                                           width: _width,
//                                                           color: Colors.pink,
//                                                           alignment:
//                                                               Alignment.center,
//                                                           child: Text(
//                                                             'Add To Cart',
//                                                             style: TextStyle(
//                                                               color:
//                                                                   Colors.white,
//                                                               fontSize:
//                                                                   _width * 0.05,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             child: Card(
//                                               elevation: 15,
//                                               color: Colors.black,
//                                               child: TextButton(
//                                                 onPressed: () {},
//                                                 child: White03(
//                                                   data: 'ADD TO CART',
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        title: Text(
          widget.data['k_name'],
          style: stylemedium(_width * 0.05, darkFontGrey),
        ),
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: _width * 0.07,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              color: darkFontGrey,
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
          SizedBox(width: _width * 0.07),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      height: _height * 0.55,
                      aspectRatio: 1,
                      viewportFraction: 1.0,
                      itemCount: widget.data['k_imgs'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.data['k_imgs'][index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Black037(data: widget.data['k_productCode']),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Obx(
                                () => IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {
                                    if (controller.isFav.value) {
                                      controller
                                          .removefromWishList(widget.data.id);
                                    } else {
                                      controller.addToWishList(widget.data.id);
                                    }
                                  },
                                  color: controller.isFav.value
                                      ? Colors.pink
                                      : Colors.grey[500],
                                ),
                              ),
                              Black029(data: 'WishList'),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.share_outlined),
                                color: Colors.grey[500],
                                onPressed: () async {
                                  final uri = Uri.parse(
                                      widget.data['k_imgs'][widget.index]);
                                  final res = await http.get(uri);
                                  final bytes = res.bodyBytes;
                                  final temp = await getTemporaryDirectory();
                                  final path = '${temp.path}/image.jpg';
                                  File(path).writeAsBytesSync(bytes);
                                  await Share.shareFiles([path],
                                      text: widget.data['k_imgs']
                                          [widget.index]);
                                },
                              ),
                              Black029(data: 'Share')
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    VxRating(
                      value: widget.data['k_rating'],
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: _width * 0.05,
                      maxRating: 5,
                      isSelectable: false,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    Text(
                      widget.data['k_price'],
                      style: stylebold(_width * 0.04, darkFontGrey),
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'seller',
                              style: stylemedium(_width * 0.04, darkFontGrey),
                            ),
                            SizedBox(
                              height: _height * 0.005,
                            ),
                            Text(
                              widget.data['k_brand'],
                              style: stylemedium(_width * 0.04, darkFontGrey),
                            ),
                          ],
                        )),
                        CircleAvatar(
                          backgroundColor: lightpinkcolor,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkpink,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(_height * 0.07)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(lightpinkcolor.withOpacity(0.5))
                        .make(),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Catelog pieces:     ',
                              style: stylemedium(_width * 0.04, textfieldGrey),
                            ),
                            Text(
                              '${widget.data['k_catelogpieces']}',
                              style: stylebold(_width * 0.04, darkFontGrey),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: _width * 0.2,
                              child: Text(
                                'Quantity: ',
                                style:
                                    stylemedium(_width * 0.04, textfieldGrey),
                              ),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.calculatetotalprice(
                                          double.parse(widget
                                              .data['k_fullcatelogprice']));
                                    },
                                    icon: Icon(Icons.remove),
                                    color: darkFontGrey,
                                  ),
                                  Text(
                                    '${controller.quantity.value}',
                                    style: stylemedium(
                                        _width * 0.04, darkFontGrey),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(widget.data['k_quantity']));
                                      controller.calculatetotalprice(int.parse(
                                          widget.data['k_fullcatelogprice']));
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: darkFontGrey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: _height * 0.02,
                                  ),
                                  Text(
                                    '${widget.data['k_quantity']} available',
                                    style: stylemedium(
                                        _width * 0.04, textfieldGrey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        Obx(
                          () => Row(
                            children: [
                              SizedBox(
                                width: _width * 0.2,
                                child: Text(
                                  'Totle: ',
                                  style:
                                      stylemedium(_width * 0.04, textfieldGrey),
                                ),
                              ),
                              Text(
                                '₹${controller.totalprice.value}',
                                style: stylemedium(_width * 0.05, pinkcolor),
                              ),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                        ),
                      ],
                    ).box.white.shadowSm.make(),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Text(
                      description,
                      style: stylebold(_width * 0.04, darkFontGrey),
                    ),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Black037(
                        data: widget.data['k_description'],
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Container(
                      height: _height * 0.37,
                      width: double.infinity,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              ItemreviewList[index],
                              style: stylemedium(_width * 0.04, darkFontGrey),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              color: darkFontGrey,
                              onPressed: () {},
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: _height * 0.01,
                            child: Container(
                              height: _height * 0.015,
                              color: lightGrey,
                            ),
                          );
                        },
                        itemCount: ItemreviewList.length,
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.01,
                      child: Container(
                        height: _height * 0.015,
                        color: lightGrey,
                      ),
                    ),
                    Text(
                      productsLike,
                      style: stylebold(_width * 0.04, darkFontGrey),
                    ),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    StreamBuilder(
                      stream: ls[widget.index],
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          return Container(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                        cat_controller.subcat.length,
                                        (index) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: fontGrey)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Text(
                                                      '${cat_controller.subcat[index]}',
                                                      style: stylemedium(
                                                          _width * 0.04,
                                                          darkFontGrey),
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
                                          cat_controller
                                              .checkIfFav(data[index]);
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
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          data[index]['k_imgs']
                                                              [0]),
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
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                child: Container(
                                                  height: _height * 0.19,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                color: Colors
                                                                    .black,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                cat_controller
                                                                    .addTocart(
                                                                  //title, price, tprice, selername, img, qty, context,vendorID
                                                                  img: data[
                                                                          index]
                                                                      [
                                                                      'k_imgs'][0],
                                                                  selername: data[
                                                                          index]
                                                                      [
                                                                      'k_brand'],
                                                                  title: data[
                                                                          index]
                                                                      [
                                                                      'k_name'],
                                                                  price: data[
                                                                          index]
                                                                      [
                                                                      'k_price'],
                                                                  context:
                                                                      context,
                                                                  qty: 1,
                                                                  tprice: cat_controller
                                                                      .totalprice
                                                                      .value,
                                                                );
                                                                print(data[index]
                                                                        [
                                                                        'k_price']
                                                                    .toString());
                                                                print(
                                                                    'added to cart');
                                                              },
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
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    // CategoryOverView(title: categoryTitleList[0], index: 0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _width * 0.47,
                  height: _height * 0.05,
                  child: customButton(
                    () {
                      controller.addTocart(
                        title: widget.data['k_productCode'],
                        // vendorID:data['vendorID'],
                        price: widget.data['k_price'],
                        img: widget.data['k_imgs'][0],
                        selername: widget.data['k_brand'],
                        context: context,
                        qty: controller.quantity.value,
                        tprice: controller.totalprice.value,
                      );
                      VxToast.show(context,
                          msg: "Added to Cart",
                          textColor: whiteColor,
                          bgColor: blackcolor,
                          pdHorizontal: 4,
                          pdVertical: 8);
                      print('added to cart');
                    },
                    addtocart,
                    pinkcolor,
                    stylemedium(_width * 0.05, whiteColor),
                  ),
                ),
                SizedBox(
                  width: _width * 0.47,
                  height: _height * 0.05,
                  child: customButton(
                    () {
                      payment(controller.totalprice.value);
                    },
                    buynow,
                    pinkcolor,
                    stylemedium(_width * 0.05, whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// MySize(data, index) {
//   return Wrap(
//     children: [data['k_sizes'][index]]
//         .map(
//           (e) => Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//                 border: Border.all(color: Colors.black, width: 1),
//               ),
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//                   child: Black035(data: e),
//                 ),
//               ),
//             ),
//           ),
//         )
//         .toList(),
//   );
// }
