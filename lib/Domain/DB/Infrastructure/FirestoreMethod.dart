import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/Domain/DB/Model/hotelSavedModel.dart';

import 'package:uuid/uuid.dart';


class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> hotelsaved({
    required String name,
      required String decription,
      required int rating,
      required String imageurl,
      required List<String> subimageurl,
      required String price,
      required String reviewno,
      required String hotelId,
      required String username,
      required String userid,
      required String userimageurl
  }) async {
    bool isOk = false;

    try {
      final String hotelId = const Uuid().v1();
      final HotelSavedModel post = HotelSavedModel(
           name: name,
        username: username,
        decription: decription,
        rating: rating,
        subimageurl: subimageurl,
        imageurl: imageurl,
        price: price,
        reviewno: reviewno,
        hotelId: hotelId,
        userid: userid,
        userimageurl: userimageurl);

      final jsonData = post.toJson();
      await _firestore.collection('SavedHotels').doc(hotelId).set(jsonData);
     
      isOk = true;
    } catch (e, stackTrace) {
      isOk = false;
      log('Error: $e\nStackTrace: $stackTrace');
    }

    return isOk;
  }

}
