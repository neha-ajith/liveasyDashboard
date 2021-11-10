import 'package:flutter/material.dart';
import 'package:liveasy_admin/services/authentication.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

// ignore: must_be_immutable
class SignOutButtonWidget extends StatelessWidget {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 100,
        child: TextButton(
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Sign Out",
                    style: TextStyle(color: black),
                    textAlign: TextAlign.center)),
            style: TextButton.styleFrom(
                elevation: 2.0,
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: signInColor),
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () async {
              await Authentication.signOut(context);
            }));
  }
}
