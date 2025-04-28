import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> fetchSavedHotels(String userId) async {
  final data = await FirebaseFirestore.instance
      .collection("SavedHotels")
      .where('userid', isEqualTo: userId)
      .get();
  log("data from function : $data");

    List<String> likedPostNumericIds = data.docs.map((doc) {
      if (doc.data().containsKey('hotelId')) {
        String fullId = doc.get('hotelId').toString();
        var parts = fullId.split('-09');
        return parts.first;
      } else {
        return '';
      }
    }).toList();
    List<String> list = List<String>.from(likedPostNumericIds);
    
    return list;
  
}
