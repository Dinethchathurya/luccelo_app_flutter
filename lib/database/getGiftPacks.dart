import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GiftPacks extends ChangeNotifier {
  var db = FirebaseFirestore.instance;
  Map<int, dynamic> allData = {};

  getGiftPacks() async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('Gift Packs');
      QuerySnapshot querySnapshot = await collectionRef.get();

      querySnapshot.docs.asMap().forEach((index, doc) {
        allData[index] = doc.data();
      });
      allData.forEach((index, data) {
        print('$index: ${data['image']}');
      });
    } catch (e) {
      print('Error getting documents: $e');
      return null;
    }
  }
}
