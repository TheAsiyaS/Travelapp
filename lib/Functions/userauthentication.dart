import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> verifyUser(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint('User signed in: ${credential.user?.uid}');
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

