import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceSavedModel {
  final String name;
  final String decription;
  final int rating;
  final String imageurl;
  final List<String> subimageurl;
  final String price;
  final String reviewno;
  final String hotelId;
  final String username;
  final String userid;
  final String userimageurl;

  PlaceSavedModel(
      {required this.name,
      required this.decription,
      required this.rating,
      required this.imageurl,
      required this.subimageurl,
      required this.price,
      required this.reviewno,
      required this.hotelId,
      required this.username,
      required this.userid,
      required this.userimageurl});
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'decription': decription,
        'rating': rating,
        'subimageurl': subimageurl,
        'imageurl': imageurl,
        'price': price,
        'reviewno': reviewno,
        'hotelId': hotelId,
        'userid': userid,
        'userimageurl': userimageurl,
      };
  static PlaceSavedModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PlaceSavedModel(
      name: snapshot['name'],
      username: snapshot['username'],
      decription: snapshot['decription'],
      rating: snapshot['rating'],
      subimageurl: snapshot['subimageurl'],
      imageurl: snapshot['imageurl'],
      price: snapshot['price'],
      reviewno: snapshot['reviewno'],
      hotelId: snapshot['hotelId'],
      userid: snapshot['userid'],
      userimageurl: snapshot['userimageurl'],
    );
  }
}
