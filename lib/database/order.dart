import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Order {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  //auth.currentUser?.uid
  order(count, product_id) {
    final order = <String, dynamic>{
      "user_id": auth.currentUser?.uid,
      "product_id": product_id,
      "count": count, // Assuming count is an integer value
    };
    db
        .collection("orders")
        .doc() // Firestore will auto-generate a unique document ID
        .set(order)
        .then((_) => print("Document successfully written"))
        .catchError((error) => print("Error writing document: $error"));
  }
}
