import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';

class EditTextTemplate extends StatelessWidget {
  String text;
  double height;
  double width;
  EditTextTemplate({required this.text, required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ,
        width: width ,
        child: FittedBox(fit: BoxFit.cover,
            child: Text(text, style: TextStyle(
                color: greyColor, fontWeight: boldWeight, fontSize: 10))));

  }
}

class EditTitleTextTemplate extends StatelessWidget {
    String text;
    double height;
    double width;
    FontWeight fontWeight;
    FontStyle? fontStyle;
    double fontSize;
    Color color;

    EditTitleTextTemplate({required this.text,required this.height,required this.width,required this.color,
        required this.fontSize,this.fontStyle,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width ,
        child: FittedBox(fit: BoxFit.cover,
            child: Text(text, style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontStyle: fontStyle,
                fontWeight: fontWeight))));
  }
}

