import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TeddyBears extends ChangeNotifier {
  var db = FirebaseFirestore.instance;
  Map<int, dynamic> allData = {};

  getTeddyBears() async {
    print('deddy');
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('Teady Bears');
      QuerySnapshot querySnapshot = await collectionRef.get();

      querySnapshot.docs.asMap().forEach((index, doc) {
        allData[index] = doc.data();
      });
      print(allData[0]['image']);
    } catch (e) {
      print('Error getting documents: $e');
      return null;
    }
  }
}
