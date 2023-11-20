import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:travelapp/Domain/DB/Infrastructure/StorageMethod.dart';
import 'package:travelapp/Domain/DB/Model/UserModel.dart';
import 'package:travelapp/common/ImageUrls.dart';
import 'package:travelapp/main.dart';
//import 'package:travelapp/presentation/UserAuthentication/SignUp/Username_profile_add.dart';

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

  Future<String> signUp({
    required String email,
    required String password,
    required String phoneNo,
    required String username,
    required String bio,
    required Uint8List? file,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      gUid = credential.user!.uid;
      final docUser = _firestore.collection('user').doc(credential.user!.uid);

      String? photoUrl;
      if (file != null) {
        photoUrl = await StorageMethods().uploadImageToStorage(
            'profilePics', file, false); //send url to func
      } else {
        photoUrl = noimg;
      }

      final data = UserData(
        additionalImfo: '',
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
        scondaryImage: '',
        photoUrl: photoUrl,
      );
      final decodedJsonObj = data.toJson();
      await docUser.set(decodedJsonObj);
      return 'ok';
    } catch (e) {
      log('=====!!!!!=$e=!!!!!!======');
      return e.toString();
    }
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
      log('user  login success');
      return true;
    }
  }

  Future<void> uploadSecondaryImage({
    required Uint8List? file,
  }) async {
    final docUser =
        FirebaseFirestore.instance.collection('user').doc(currentuserdata.uid);
    String? photoUrl;
    if (file != null) {
      photoUrl = await StorageMethods().uploadImageToStorage(
          'secondaryProfilePics', file, false); //send url to func
      // final usermodel = UsernameModel();
      // usermodel.imageBytes = file;
      // usermodel.notifyListeners();
    } else {
      photoUrl = noimg;
    }

    docUser.update({'scondaryImage': photoUrl});
  }

  Future<void> uploadUsername({required String username}) async {
    if (username.isNotEmpty) {
      final docUser = FirebaseFirestore.instance
          .collection('user')
          .doc(currentuserdata.uid);
      docUser.update({'username':username});
    } else {}
  }
}
