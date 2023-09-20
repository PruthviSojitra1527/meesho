import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meesho/model/jsonCategoryModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/firebase_consts.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quantity = 1.obs;
  var totalprice = 0.00.obs;
  var isFav = false.obs;

  getsubcategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  increaseQuantity(totalquantity) {
    if (quantity.value < totalquantity) {
      quantity.value++;
    } else {
      quantity.value == totalquantity;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    } else {
      quantity.value == 1;
    }
  }

  calculatetotalprice(price) {
    totalprice.value = double.parse((price * quantity.value).toString());
    // print('price ==== $price');
    // print('quantity ===== ${quantity.value}');
    // print('valueee________${totalprice.value}');
  }

  addTocart({title, price, tprice, selername, img, qty, context,vendorID}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'price': price,
      'tprice': tprice,
      'selername': selername,
      'img': img,
      'qty': qty,
      'vendorID':vendorID,
      'added_by': currentUser!.uid,
    }).catchError((e) {
      print('error of add to cart is $e');
    });
  }

  resetValue() {
    totalprice.value = 0.0;
    quantity.value = 1;
  }

  //add to wishlist
  addToWishList(docId) async {
    await firestore.collection(kurtisCollection).doc(docId).set({
      'k_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
  }
  removefromWishList(docId) async {
    await firestore.collection(kurtisCollection).doc(docId).set({
      'k_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
  }
  checkIfFav(data)async{
    if(data['k_wishlist'].contains(currentUser!.uid)){
      isFav(true);
    }else{
      isFav(false);
    }
  }
}
