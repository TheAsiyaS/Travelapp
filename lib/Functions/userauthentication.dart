import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/Domain/DB/Model/UserModel.dart';
import 'package:travelapp/main.dart';

Future<bool> verifyUser(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user?.uid;
    debugPrint('User signed in: $uid');

    if (uid != null) {
      // Fetch user data from Firestore
      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        currentuserdata.value = UserData(
          phoneNumber: data['phoneNumber'] ?? '',
          bookedhotels: List<String>.from(data['bookedhotels'] ?? []),
          favhotels: List<String>.from(data['favhotels'] ?? []),
          dateJoin: data['dateJoin'] ?? '',
          photoUrl: data['photoUrl'] ?? '',
          username: data['username'] ?? '',
          email: data['email'] ?? '',
          password: data['password'] ?? '',
          bio: data['bio'] ?? '',
          changeUsername: data['changeUsername'] ?? 0,
          favplaces: List<String>.from(data['favplaces'] ?? []),
          bookedplaces: List<String>.from(data['bookedplaces'] ?? []),
          name: data['name'] ?? '',
          scondaryImage: data['scondaryImage'] ?? '',
          additionalImfo: data['additionalImfo'] ?? '',
        );
      }
    }

    return true;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'user-not-found':
        debugPrint('No user found for that email.');
        break;
      case 'wrong-password':
        debugPrint('Wrong password provided for that user.');
        break;
      default:
        debugPrint('Error signing in: ${e.message}');
    }
    return false;
  } catch (e) {
    debugPrint('Unexpected error: $e');
    return false;
  }
}

