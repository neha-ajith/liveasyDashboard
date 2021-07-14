import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/signOutButton.dart';

PreferredSize appBar() {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  return PreferredSize(
    preferredSize: Size(width * 1440, height * 45),
    child: AppBar(
        backgroundColor: signInColor,
        leading: Row(children: [
          SizedBox(width: width * 23),
          Container(
              height: height * 25,
              width: width * 25,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('icons/liveasy_logo_white.png',
                      width: width * 25, height: height * 24.33)))
        ]),
        titleSpacing: width * 10,
        title: Container(
            height: height * 24,
            width: width * 77,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text('Liveasy',
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: boldWeight)))),
        actions: [
          IconButton(
              onPressed: () {}, // Search Logic pending
              icon: Icon(Icons.search),
              iconSize: 17),
          SizedBox(width: width * 19),
          Center(child: Text("admin")),
          SizedBox(width: width * 10),
          Center(
              child: IconButton(
                  onPressed: () {}, //Admin Account settings
                  icon: Icon(Icons.person),
                  iconSize: 25)),
          SignOutButtonWidget(),
          SizedBox(width: width * 50)
        ]),
  );
}
