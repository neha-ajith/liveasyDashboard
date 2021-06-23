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

  static Future<String?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;
    final User? user = _auth.currentUser;
    if (authSignedIn == true && user != null) {
      userUid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
      print('$userUid $name $userEmail $imageUrl');
      userData.addAll([userUid, name, userEmail, imageUrl]);
      return "Pass";
    } else {
      return null;
    }
  }

  static void signInWithEmail(
      {required BuildContext context, email, password}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      if (user != null) {
        userUid = user.uid;
        userEmail = user.email;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
        userData.add(userUid);
        userData.add(name);
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
    print('User signed out');
    customSnackBar(content: 'User signed out');
    Get.to(() => LoginScreen());
  }

  static void signInWithGoogle({required BuildContext context}) async {
    User? user;
    // ignore: unused_local_variable
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
    if (user != null) {
      userUid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      userData.addAll([userUid, name, userEmail, imageUrl]);
      Get.to(() => Dashboard(userData: userData));
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
    print("User signed out of Google account");
    customSnackBar(content: "User signed out of Google account");
    Get.to(() => LoginScreen());
  }
}
