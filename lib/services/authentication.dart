import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';
import 'package:liveasy_admin/screens/dashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Authentication {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static String? userUid;
  static String? userEmail;
  static String? name;
  static String? imageUrl;
  static List<String?> userData = [];

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<List<String?>?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;
    final User? user = _auth.currentUser;
    if (authSignedIn == true && user != null) {
      userUid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
      userData.addAll([userUid, name, userEmail, imageUrl]);
      return userData;
    } else {
      return null;
    }
  }

  static void signInWithEmail(
      {required BuildContext context,
      required email,
      required password,
      required keepLoggedIn}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      if (user != null) {
        userUid = user.uid;
        userEmail = user.email;
        if (keepLoggedIn) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('auth', true);
        }
        userData.addAll([userUid, userEmail]);
        Get.to(() => Dashboard(userData: userData));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackBar(content: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        customSnackBar(content: 'Wrong password provided for that user.');
      }
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    userUid = null;
    userEmail = null;
    customSnackBar(content: 'User signed out');
    Get.to(() => LoginScreen());
  }

  static void signInWithGoogle(
      {required BuildContext context, required keepLoggedIn}) async {
    User? user;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);
      user = userCredential.user;
      if (user != null) {
        userUid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;
        if (keepLoggedIn) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('auth', true);
        }
        userData.addAll([userUid, name, userEmail, imageUrl]);
        Get.to(() => Dashboard(userData: userData));
      }
    } catch (e) {
      customSnackBar(content: '$e');
    }
  }

  static Future<void> signOutGoogle() async {
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    userUid = null;
    name = null;
    userEmail = null;
    imageUrl = null;
    customSnackBar(content: "User signed out of Google account");
    Get.to(() => LoginScreen());
  }
}
