import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';


class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User get getUser => _auth.currentUser;                                        //was supposed to be future<User> but it was not acceptable
  Stream<User> get user => _auth.authStateChanges();

  Future<User> googleSignIn () async {
    try{
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuth = await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuth.idToken,
        accessToken: googleSignInAuth.accessToken
      );

      User user = (await _auth.signInWithCredential(authCredential)).user;
      return user;
    } catch(e){
      print(e);
      return null;
    }
  }

  Future<void> signOut () {
    return _auth.signOut();
  }

}