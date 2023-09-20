import 'package:get/get.dart';
import 'package:meesho/consts/firebase_consts.dart';
import 'package:meesho/decoration/strings.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products according to category
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }

  static getKurtis(category) {
    return firestore
        .collection(kurtisCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }
  static getSaree(category) {
    return firestore
        .collection(sareesCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }
  static getLehenga(category) {
    return firestore
        .collection(lehengaCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }
  static getWesturn(category) {
    return firestore
        .collection(westurnCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }
  static getGown(category) {
    return firestore
        .collection(gownCollection)
        .where('k_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }
  // dlt document
  //catch image
static dltDocs(docID){
return firestore.collection(cartCollection).doc(docID).delete();
}
}
