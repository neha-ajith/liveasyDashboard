import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/services/authentication.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  List<String?>? userData;
  Dashboard({Key? key, required this.userData}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print(widget.userData);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double _safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    double _safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    double safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 1000;
    double safeBlockVertical = (screenHeight - _safeAreaVertical) / 1000;
    return Scaffold(
      body: Center(
        child: Container(
          height: safeBlockVertical * 69.336,
          width: safeBlockHorizontal * 311.8,
          child: MaterialButton(
              onPressed: () async {
                if (widget.userData!.length < 4) {
                  print(widget.userData);
                  Authentication.signOut();
                } else {
                  Authentication.signOutGoogle();
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('auth', false);
                Get.to(() => LoginScreen());
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: signInColor),
                  borderRadius: BorderRadius.circular(radius_25)),
              color: white,
              child: Row(
                children: [
                  Text('Sign out',
                      style: TextStyle(
                          color: signInColor,
                          fontSize: hint_text,
                          fontWeight: regularWeight))
                ],
              )),
        ),
      ),
    );
  }
}
