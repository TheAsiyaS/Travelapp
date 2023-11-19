import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String phoneNumber;
  final String username;
  final String photoUrl;
  final String email;
  final String password;
  String? uid;
  final String bio;
  final String dateJoin;
  final int changeUsername;
  final String name;
  final List<dynamic> favhotels;
  String? acLocation;
  final List<dynamic> favplaces;
  final List<dynamic> bookedhotels;
  final List<dynamic> bookedplaces;
  final String scondaryImage;
  final String additionalImfo;

  UserData(
      {required this.phoneNumber,
      this.uid,
      required this.bookedhotels,
      required this.favhotels,
      required this.dateJoin,
      required this.photoUrl,
      required this.username,
      required this.email,
      required this.password,
      required this.bio,
      required this.changeUsername,
      required this.favplaces,
      required this.bookedplaces,
      required this.name,
      required this.scondaryImage,
      required this.additionalImfo,
      this.acLocation});

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'username': username,
        'email': email,
        'password': password,
        'photoUrl': photoUrl,
        'uid': uid,
        'bio': bio,
        'dateJoin': dateJoin,
        'changeUsername': changeUsername,
        'name': name,
        'favhotels': favhotels,
        'acLocation': acLocation,
        'favplaces': favplaces,
        'bookedhotels': bookedhotels,
        'bookedplaces': bookedplaces,
        'scondaryImage': scondaryImage,
        'additionalImfo': additionalImfo
      };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      additionalImfo: snapshot['additionalImfo'],
      scondaryImage: snapshot['scondaryImage'],
      bookedhotels: snapshot['bookedhotels'],
      phoneNumber: snapshot['phoneNumber'],
      username: snapshot['username'],
      email: snapshot['email'],
      password: snapshot['password'],
      photoUrl: snapshot['photoUrl'],
      uid: snapshot['uid'],
      bio: snapshot['bio'],
      dateJoin: snapshot['dateJoin'],
      changeUsername: snapshot['changeUsername'],
      name: snapshot['name'],
      favplaces: List<dynamic>.from(snapshot['favplaces']),
      acLocation: snapshot['acLocation'],
      bookedplaces: snapshot['bookedplaces'],
      favhotels: List<dynamic>.from(snapshot['favhotels']),
    );
  }
}
