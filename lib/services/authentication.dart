import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveasy_admin/screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';

class Authentication {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static String? userUid;
  static String? userEmail;
  static List<String?> userData = [];

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      content: Center(
          child: Text(
        content,
      )),
    );
  }

  static Future<List<String?>?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;
    final User? user = _auth.currentUser;
    if (authSignedIn == true && user != null) {
      userUid = user.uid;
      userEmail = user.email;
      userData.addAll([userUid, userEmail]);
      return userData;
    }
  }

  static void signInWithEmail(
      {required BuildContext context,
      required email,
      required password}) async {
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
        userData.addAll([userUid, userEmail]);
        Get.to(() => HomeScreen(userData: userData));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(content: 'Email not Found'));
          break;
        case 'wrong-password':
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(content: 'Invalid Password'));
          break;
      }
    }
  }

  static Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    userUid = null;
    userEmail = null;
    userData = [null, null];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('auth', false);

    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(content: 'Signed Out'));
    Get.to(() => LoginScreen());
  }
}
