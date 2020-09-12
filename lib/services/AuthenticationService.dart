import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petro/ServiceLocator.dart';
import 'package:petro/datamodel/User.dart';
import 'dart:async';

import 'package:petro/services/DatabaseService.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final DatabaseService _db = locator<DatabaseService>();

  // variable for the viewmodels to instantly access data(CustomUser) of current
  // user loggedin
  CustomUser _currentUser;

  //getter function to access the private variable _currentUser
  CustomUser get currentUser => _currentUser;

  // Function for instantiating the _currentUser variable upon login, signup or
  // at startup
  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _db.getUser(user.uid);
    }
  }

  // function to check whether user is logged in or not at startup, if user is
  // logged in then populate the _currentUser variable and return a bool value
  // depending on the result
  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  // function to login. returns bool value according to the condition     ssa
  // (authResult.user != null) and if error occurs the returns the error me^ge
  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(authResult.user);
      return authResult.user != null; //return true if condition is true
    } catch (e) {
      return e.toString();
    }
  }

  // function to signup. Signsup, calls function to create user document to store
  // user data in firestore collection
  Future signUpWithEmail(
      {@required String email,
      @required String password,
      @required String username}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _db.createUser(CustomUser.fromMap({
        'UID': _auth.currentUser.uid,
        'profilePhotoURL': null,
        'username': username,
        'followerCount': 0,
        'followingCount': 0,
      }));
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<User> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuth.idToken,
          accessToken: googleSignInAuth.accessToken);

      User user = (await _auth.signInWithCredential(authCredential)).user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
