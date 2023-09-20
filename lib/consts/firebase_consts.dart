import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;
const usersCollection = 'Users',
    productsCollection = 'products',
      kurtisCollection = 'kurtis',
    sareesCollection = 'sarees',
    westurnCollection = 'westurnWear',
    gownCollection = 'gown',
    lehengaCollection = 'lehenga',
    cartCollection = 'cart';
