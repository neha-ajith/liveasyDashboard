import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class CancelButtonWidget extends StatelessWidget {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: Size(width * 165, height * 32),
            backgroundColor: white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: black),
                borderRadius: BorderRadius.circular(radius_3+1))),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Container(
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text('Cancel',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: black,
                        fontSize: 16,
                        fontWeight: regularWeight)))));
  }
}
