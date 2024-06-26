import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DreamCatcher extends ChangeNotifier {
  var db = FirebaseFirestore.instance;
  Map<int, dynamic> allData = {};

  getDreamCatcher() async {
    // print('DreamCatcher');
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('Dream Catcher');
      QuerySnapshot querySnapshot = await collectionRef.get();

      querySnapshot.docs.asMap().forEach((index, doc) {
        allData[index] = doc.data();
      });
      // allData.forEach((index, data) {
      //   print('$index: ${data['image']}');
      // });
    } catch (e) {
      print('Error getting documents: $e');
      return null;
    }
  }
}
