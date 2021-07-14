import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class RejectButtonWidget extends StatelessWidget {
  RejectButtonWidget({Key? key, required String type}) : super(key: key);
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: white,
            fixedSize: Size(width * 78, height * 26),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: black),
                borderRadius: BorderRadius.circular(radius_25))),
        onPressed: () {},
        child: Container(
            height: height * 12,
            width: width * 34,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text('Reject',
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 10,
                        fontWeight: regularWeight)))));
  }
}
