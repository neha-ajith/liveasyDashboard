import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSize.dart';
import 'package:liveasy_admin/constants/space.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: safeBlockVertical * height_71),
      Text('Dashboard',
          style: TextStyle(
              fontSize: size_32, color: greyColor, fontWeight: regularWeight)),
      SizedBox(height: safeBlockVertical * height_45),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            shadowColor: black,
            elevation: 2.0,
            child: Container(
                height: safeBlockVertical * height_102,
                width: safeBlockHorizontal * dashboardCardwidth,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('459',
                          style: TextStyle(
                              fontSize: size_34,
                              color: visitor,
                              fontWeight: normalWeight)),
                      Text('VISITORS ON SITE')
                    ]))),
        SizedBox(width: safeBlockHorizontal * width_20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * height_102,
                width: safeBlockHorizontal * dashboardCardwidth,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('459',
                          style: TextStyle(
                              fontSize: size_34,
                              color: appDownload,
                              fontWeight: normalWeight)),
                      Text('APP DOWNLOADS')
                    ]))),
        SizedBox(width: safeBlockHorizontal * width_20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * height_102,
                width: safeBlockHorizontal * dashboardCardwidth,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('459',
                          style: TextStyle(
                              fontSize: size_34,
                              color: activeTransporter,
                              fontWeight: normalWeight)),
                      Text('ACTIVE TRANSPORTERS')
                    ]))),
        SizedBox(width: safeBlockHorizontal * width_20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * height_102,
                width: safeBlockHorizontal * dashboardCardwidth,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('459',
                          style: TextStyle(
                              fontSize: size_34,
                              color: activeTransporter,
                              fontWeight: normalWeight)),
                      SizedBox(
                        height: safeBlockVertical * height_4,
                      ),
                      Text('ACTIVE SHIPPERS',
                          style:
                              TextStyle(color: signInColor, fontSize: size_18))
                    ])))
      ])
    ]);
  }
}
