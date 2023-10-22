import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPass) async {
    // Register app
    Reference ref = storage.ref().child(childName).child(auth.currentUser!.uid);
    if (isPass) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    // Upload image to Firebase
    UploadTask task = ref.putData(file);
    // Wait for upload to complete
    TaskSnapshot snapshot = await task;
    // Get download URL
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}