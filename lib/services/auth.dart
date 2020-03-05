import 'package:categories2/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth {
  Future<dynamic> signInWithEmailAndPassword(String email, String password);
  Future<dynamic> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();

//
//Future<FirebaseUser> getCurrentUser();
//   Future<void> sendEmailVerification();
//   Future<bool> isEmailVerified();

}

class AuthService implements BaseAuth {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // uderscore means it is private

//create user object based on firebase object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    //call 'user' here whatever you want
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user)); easier way to do in next line
        .map(_userFromFirebaseUser);
  }

  //sign in anonymous
  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          //signInWithEmailAndPassword: this is from the firebase library
          email: email,
          password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email or passeword
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          //createUserWithEmailAndPassword: this is from the firebase library
          email: email,
          password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//match the email Account Recovery
//Future accountRecovery(String )

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

/*
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
*/

}
