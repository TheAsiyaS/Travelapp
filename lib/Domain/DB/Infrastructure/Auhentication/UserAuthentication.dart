import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:travelapp/Domain/DB/Infrastructure/StorageMethod.dart';
import 'package:travelapp/Domain/DB/Model/UserModel.dart';
import 'package:travelapp/common/ImageUrls.dart';

String? gUid;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserData> getUserDetail() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot snapshot =
        await _firestore.collection('user').doc(currentUser!.uid).get();

    if (snapshot.exists) {
      return UserData.fromSnap(snapshot);
    } else {
      throw Exception("User document does not exist");
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String phoneNo,
    required String username,
    required String bio,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      gUid = credential.user!.uid;
      final docUser = _firestore.collection('user').doc(credential.user!.uid);
      final data = UserData(
        changeUsername: 0,
        phoneNumber: phoneNo,
        dateJoin: DateTime.now().toString(),
        username: username,
        email: email,
        password: password,
        bio: bio,
        favhotels: [],
        favplaces: [],
        uid: credential.user!.uid,
        bookedplaces: [],
        bookedhotels: [],
        acLocation: '',
        name: '',
        photoUrl: noimg,
      );
      final decodedJsonObj = data.toJson();
      await docUser.set(decodedJsonObj);
    } catch (e) {
      log('=====!!!!!=$e=!!!!!!======');
    }
  }
Future<String> addProfilePic({required Uint8List file, uid}) async {
    try {
      if (file.isNotEmpty) {
        final docUser =
            FirebaseFirestore.instance.collection('user').doc(gUid ?? uid);
        log('Uid----$gUid');
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        docUser.update({'photoUrl': photoUrl});
        log('Photo Url -----$photoUrl');
        return photoUrl;
      }
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
    return '';
  }
  Future<bool> loginUser(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return false;
    } else {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        log(e.toString());
        return false;
      }
      log('user can login success');
      return true;
    }
  }
}
