import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class RejectButtonWidget extends StatelessWidget {
  RejectButtonWidget({Key? key, required String type}) : super(key: key);
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: safeBlockVertical * 26,
      width: safeBlockHorizontal * 78,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: black),
              borderRadius: BorderRadius.circular(radius_25)),
          color: white,
          onPressed: () {},
          child: Text('Rejected',
              style: TextStyle(
                  color: greyColor,
                  fontSize: size_12,
                  fontWeight: regularWeight))),
    );
  }
}
