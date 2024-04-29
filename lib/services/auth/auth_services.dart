import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class AuthService extends ChangeNotifier{
  UserModel? _userModel;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user info to Firestore if it doesn't already exist
      DocumentSnapshot userSnapshot =
      await _firestore.collection("Users").doc(userCredential.user!.uid).get();
      if (!userSnapshot.exists) {
        await _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'imageUrl': userCredential.user!.photoURL,
            'uid': userCredential.user!.uid,
            'email': email,

          },
        );
      }

      //save user info in a seperate doc
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'imageUrl': userCredential.user!.photoURL,
            'uid':userCredential.user!.uid,
            'email':email,
            'password':password
          });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      throw Exception(e.code);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
