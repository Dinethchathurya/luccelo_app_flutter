import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Customize {
  customize(category, description) {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;

    final order = <String, dynamic>{
      "user_id": auth.currentUser?.uid,
      "category": category,
      "description": description,
      // Assuming count is an integer value
    };
    db
        .collection("customize")
        .doc()
        .set(order)
        .then((_) => print("Document successfully written"))
        .catchError((error) => print("Error writing document: $error"));
    //
  }
}
