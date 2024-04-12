import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class Order {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  order(count, product_id, TextEditingController addressController,
      String? selectedShippingmethod, String? selectedpaymentMethod) {
    final order = <String, dynamic>{
      "user_id": auth.currentUser?.uid,
      "product_id": product_id,
      "count": count,
      "email": addressController,
      "selected Shipping method": selectedShippingmethod,
      "selected payment Method": selectedpaymentMethod,
    };
    db
        .collection("orders")
        .doc() // Firestore will auto-generate a unique document ID
        .set(order)
        .then((_) => print("Document successfully written"))
        .catchError((error) => print("Error writing document: $error"));
  }
}
