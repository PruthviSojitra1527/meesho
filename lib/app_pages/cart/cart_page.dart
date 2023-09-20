import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/authenticatioin/cart_authentication.dart';
import 'package:meesho/consts/firebase_consts.dart';
import 'package:meesho/services/firestore_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../commen/button.dart';
import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/textstyle.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  payment_success() {
    print("payment successfully done....");
  }

  payment_error() {
    print("payment error.....");
  }

  payment(cart_controller) {
    var options = {
      'key': 'rzp_test_U5fKj454uoyfBg',
      'amount': num.parse(cart_controller.totalP.toString()) * 100,
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

  @override
  Widget build(BuildContext context) {
    var cart_controller = Get.put(CartController());
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Image.asset(
            backgroundimage,
            fit: BoxFit.fill,
          ),
          backgroundColor: whiteColor,
          title: Text(
            'Cart',
            style: stylemain(_width * 0.07, pinkcolor),
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
        ),
          body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'Cart is Empty!',
                    style: stylemedium(_width * 0.04, darkFontGrey),
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                cart_controller.calculate(data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                            child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Container(
                                        height: _width * 0.15,
                                        width: _width * 0.15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                data[index]['img'],
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      title: Text(
                                        '${data[index]['title']}  (x${data[index]['qty']})',
                                        style: stylemedium(
                                            _width * 0.035, darkFontGrey),
                                      ),
                                      subtitle: Text(
                                        '${data[index]['tprice']}',
                                        style: stylebold(_width * 0.04, pinkcolor),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: pinkcolor,
                                          size: _width * 0.05,
                                        ),
                                        onPressed: () {
                                          print('click');
                                          print(snapshot.data?.docs[index].id);
                                          FirestoreServices.dltDocs(data[index].id);
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 2,
                                    );
                                  },
                                  itemCount: data.length),
                            ),
                      ),
                      SizedBox(
                        height: _height * 0.001,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'total price',
                            style: stylebold(_width * 0.04, darkFontGrey),
                          ),
                          Obx(()=>Text(
                              '${cart_controller.totalP}',
                              style: stylebold(_width * 0.04, pinkcolor),
                            ),
                          ),
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(12))
                          .color(lightgolden)
                          .width(_width - _width * 0.1)
                          .roundedSM
                          .make(),
                      SizedBox(
                        width: _width - _width * 0.1,
                        child: customButton(
                          () {
                            payment(cart_controller);
                          },
                          'Proceed to sheeping',
                          pinkcolor,
                          stylebold(_width * 0.04, whiteColor),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
    );
  }

}
