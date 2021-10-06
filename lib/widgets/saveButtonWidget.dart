import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class SaveButtonWidget extends StatelessWidget {
  Function onPressed;
  SaveButtonWidget({required this.onPressed});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: signInColor,
          fixedSize: Size(width * 165, height * 32),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: black),
              borderRadius: BorderRadius.circular(radius_3+1)),
        ),
        onPressed: () async {
          await onPressed();
        },
        child: Container(
            height: height * 18,
            width: width * 109,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text('Save Changes',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: white,
                        fontSize: 16,
                        fontWeight: regularWeight)))));
  }
}
