// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/functions/downloadImage.dart';

class DownloadButtonWidget extends StatelessWidget {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  DownloadButtonWidget({
    Key? key,
    required this.doc,
  }) : super(key: key);
  final String doc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: Size(width * 165, height * 32),
            backgroundColor: signInColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: black),
                borderRadius: BorderRadius.circular(radius_3 + 1))),
        onPressed: () {
          saveDocument(doc);
        },
        child: Container(
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text('Download',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: white,
                        fontSize: 16,
                        fontWeight: regularWeight)))));
  }
}
