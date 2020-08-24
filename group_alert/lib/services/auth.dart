import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:group_alert/other/helperFunctions.dart';
import 'package:group_alert/other/user.dart';
import 'package:group_alert/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      if (user.isEmailVerified) {
        // only allow app access if verified
        return _userFromFirebaseUser(user);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // email verification
      try {
        await user.sendEmailVerification();
        return user.uid;
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
      }

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signInWithGoogle(BuildContext context) async {
    // TODO: confirm signInWithGoogle works
    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);

    if (result == null) {
    } else {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  Future signUpWithGoogle(BuildContext context) async {
    // TODO: signUpWithGoogle
  }

  Future signOut() async {
    try {
      HelperFunctions.saveUserLoggedInSharedPreference(false);
      HelperFunctions.saveUserEmailSharedPreference(null);
      HelperFunctions.saveUserNameSharedPreference(null);
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future deleteAccount() async {
    try {
      HelperFunctions.saveUserLoggedInSharedPreference(false);
      HelperFunctions.saveUserEmailSharedPreference(null);
      HelperFunctions.saveUserNameSharedPreference(null);
      DatabaseMethods().deleteUser();
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return user.delete();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
