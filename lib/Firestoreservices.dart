import 'package:cloud_firestore/cloud_firestore.dart';

class Firestoreservices{
  static getSellers(){
    return  FirebaseFirestore.instance.collection('Users').where('seller', isEqualTo: "true").snapshots();
  }
  static getProducts(catagory){
    return  FirebaseFirestore.instance.collection('Products').where('p_catagory', isNotEqualTo: catagory).snapshots();
  }
}