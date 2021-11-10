import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/space.dart';

class completedDialog extends StatefulWidget {
  String? upperDialogText;
  String? lowerDialogText;

  completedDialog(
      {Key? key, required this.upperDialogText, required this.lowerDialogText})
      : super(key: key);

  @override
  _completedDialogState createState() => _completedDialogState();
}

class _completedDialogState extends State<completedDialog> {
  get liveasyBlackColor => null;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https://cdn.dribbble.com/users/2185205/screenshots/7886140/02-lottie-tick-01-instant-2.gif",
                width: space_22,
                height: space_22,
              ),
              Text(
                widget.upperDialogText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: mediumBoldWeight,
                    fontSize: size_8,
                    color: liveasyBlackColor),
              ),
              Text(
                widget.lowerDialogText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: mediumBoldWeight,
                    fontSize: size_8,
                    color: liveasyBlackColor),
              ),
            ],
          )),
    );
  }
}
