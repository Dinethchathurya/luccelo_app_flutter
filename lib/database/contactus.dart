import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Contactus {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  //auth.currentUser?.uid
  contactus(message, String? email, String name) {
    final order = <String, dynamic>{
      "user_id": auth.currentUser?.uid,
      "message": message,
      "email": email,
      "name": name, // Assuming count is an integer value
    };
    db
        .collection("contactus")
        .doc() // Firestore will auto-generate a unique document ID
        .set(order)
        .then((_) => print("Document successfully written"))
        .catchError((error) => print("Error writing document: $error"));
  }
}
