import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/Domain/DB/Model/hotelSavedModel.dart';
import 'package:travelapp/Domain/DB/Model/placeSavedModel.dart';


class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> hotelsaved(
      {required String name,
      required String decription,
      required int rating,
      required String imageurl,
      required List<String> subimageurl,
      required String price,
      required String reviewno,
      required String username,
      required String userid,
      required String userimageurl,
      required String hotelId}) async {
    bool isOk = false;

    try {
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
 Future<bool> hotelBooked(
      {required String name,
      required String decription,
      required int rating,
      required String imageurl,
      required List<String> subimageurl,
      required String price,
      required String reviewno,
      required String username,
      required String userid,
      required String userimageurl,
      required String hotelId}) async {
    bool isOk = false;

    try {
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

  Future<String> placesaved(
      {required String name,
      required String decription,
      required int rating,
      required String imageurl,
      required List<String> subimageurl,
      required String price,
      required String reviewno,
      required String username,
      required String userid,
      required String userimageurl,
      required String placeId}) async {
    String isOk = '';
    try {
      final PlaceSavedModel place = PlaceSavedModel(
         
          name: name,
          username: username,
          decription: decription,
          rating: rating,
          subimageurl: subimageurl,
          imageurl: imageurl,
          price: price,
          reviewno: reviewno,
          placeId: placeId,
          userid: userid,
          userimageurl: userimageurl);

      final jsonData = place.toJson();
      await _firestore.collection('SavedPlaces').doc(placeId).set(jsonData);

      isOk = 'ok';
    } catch (e, stackTrace) {
      isOk = '';
      log('Error: $e\nStackTrace: $stackTrace');
    }

    return isOk;
  }

  /*---------------------------------------------------------!!!!!--------------------------------------- */
  Future<bool> deletePlaceSaved({required String placedId}) async {
    try {
      await _firestore.collection('SavedPlaces').doc(placedId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteHotelSaved({required String hotelId}) async {
    try {
      await _firestore.collection('SavedHotels').doc(hotelId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
