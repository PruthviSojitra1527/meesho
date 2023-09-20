import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  Future<UserCredential> loginMethod({email, password, context}) async {
  late  UserCredential userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('errror:----------------- $e');
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  Future<UserCredential> signUpMethod({email, password, context}) async {
    late UserCredential userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString(),showTime: 5000);
    }
    return userCredential;
  }

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count':'00',
      'wishlist_count':'00',
      '_count':'00',
    });
  }

  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
