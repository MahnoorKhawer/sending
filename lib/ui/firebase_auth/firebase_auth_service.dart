// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// class FirebaseAuthService{
//
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   FirebaseAuth _auth=FirebaseAuth.instance;
//
//   Future<User?> signUpWithEmailAndPassword(String email, String password)async
//   {
//     try{
//       UserCredential credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     }
//     on FirebaseAuthException catch(e){
//
//     }
//     return null;
//   }
//
//   Future<User?> signInWithEmailAndPassword(String email, String password)async
//   {
//     try{
//       UserCredential credential= await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     }
//     catch(e){
//       print('Some error');
//     }
//     return null;
//   }
//   Future<User?> signInWithCredential(AuthCredential credential)async{
//     UserCredential usercredential= await _auth.signInWithCredential(credential);
//     return usercredential.user;
//   }
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      print('Unknown error occurred: $e');
    }
    return null;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      print('Unknown error occurred: $e');
    }
    return null;
  }

  // Sign in with credentials (e.g., Google, Facebook)
  Future<User?> signInWithCredential(AuthCredential credential) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      print('Unknown error occurred: $e');
    }
    return null;
  }

  // Handle Firebase Authentication exceptions
  void _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        print('Invalid email format.');
        break;
      case 'user-disabled':
        print('User has been disabled.');
        break;
      case 'user-not-found':
        print('No user found with this email.');
        break;
      case 'wrong-password':
        print('Wrong password provided.');
        break;
      case 'email-already-in-use':
        print('The email address is already in use by another account.');
        break;
      default:
        print('Error: ${e.message}');
    }
  }
}
