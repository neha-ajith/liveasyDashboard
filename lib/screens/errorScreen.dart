import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/space.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'OOPS!!\n Some Error With The Web App, \nEither Wait OR Please Try Again Later',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size_20,
                  ),
                ),
                SizedBox(
                  height: radius_30,
                ),
                Icon(
                  Icons.error,
                  size: 70,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
