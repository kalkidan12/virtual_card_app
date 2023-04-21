import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:investmentmanager/Model/ResponseModel.dart';

enum signStatus {
  uninitialized,
  loginauthenticating,
  signupauthenticating,
  unauthenticated,
  authenticated,
}

class AuthProvider with ChangeNotifier {
  String? statusMessage = '';
  int? statusCode;
  FirebaseAuth? _auth;
  User? _user;
  signStatus _status = signStatus.uninitialized;

  signStatus get status => _status;
  User? get user => _user;

  Future<void> signIn(String email, String password) async {
    try {
      _status = signStatus.loginauthenticating;
      notifyListeners();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      statusCode = 200;
      _status = signStatus.authenticated;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      statusMessage = e.message;
      statusCode = 500;
      _status = signStatus.unauthenticated;
      notifyListeners();
    }
  }

  Future signOut() async {
    _auth!.signOut();
    _status = signStatus.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> registerUser(String firstName, String lastName,
      String phoneNumber, String email, String password) async {
    try {
      _status = signStatus.signupauthenticating;
      notifyListeners();
      // Create a new user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update the user's display name
      await userCredential.user!.updateDisplayName("$firstName $lastName");

      // Add user's details to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
      });
      _status = signStatus.authenticated;
      statusCode = 200;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        statusCode = 500;
        statusMessage = e.message;

        _status = signStatus.unauthenticated;
        notifyListeners();

        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        statusCode = 500;
        statusMessage = e.message;
        _status = signStatus.unauthenticated;
        notifyListeners();

        // print('The account already exists for that email.');
      } else {
        statusCode = 500;
        statusMessage = e.message;
        _status = signStatus.unauthenticated;
        notifyListeners();
      }
    } catch (e) {
      statusCode = 500;
      statusMessage = e.toString();
      _status = signStatus.unauthenticated;
      notifyListeners();
      print(e);
    }
  }
}
