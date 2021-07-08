import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  late int visitorsOnSite; //TODO: Data Source
  late int appDownloads;
  late int activeTransporters;
  late int activeShippers;

  @override
  Widget build(BuildContext context) {
    visitorsOnSite = 449;
    appDownloads = 449;
    activeTransporters = 449;
    activeShippers = 449;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: safeBlockVertical * 37),
      Text('Dashboard',
          style: TextStyle(
              fontSize: size_32, color: greyColor, fontWeight: regularWeight)),
      SizedBox(height: safeBlockVertical * 40),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            shadowColor: black,
            elevation: 2.0,
            child: Container(
                height: safeBlockVertical * 108,
                width: safeBlockHorizontal * 265, //260
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$visitorsOnSite',
                          style: TextStyle(
                              fontSize: size_34,
                              color: visitor,
                              fontWeight: normalWeight)),
                      SizedBox(
                        height: safeBlockVertical * 5,
                      ),
                      Text('VISITORS ON SITE',
                          style:
                              TextStyle(color: signInColor, fontSize: size_18))
                    ]))),
        SizedBox(width: safeBlockHorizontal * 20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * 108,
                width: safeBlockHorizontal * 260, //265
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$appDownloads',
                          style: TextStyle(
                              fontSize: size_34,
                              color: appDownload,
                              fontWeight: normalWeight)),
                      SizedBox(
                        height: safeBlockVertical * 5,
                      ),
                      Text('APP DOWNLOADS',
                          style:
                              TextStyle(color: signInColor, fontSize: size_18))
                    ]))),
        SizedBox(width: safeBlockHorizontal * 20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * 108,
                width: safeBlockHorizontal * 260, //265
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$activeTransporters',
                          style: TextStyle(
                              fontSize: size_34,
                              color: activeTransporter,
                              fontWeight: normalWeight)),
                      SizedBox(
                        height: safeBlockVertical * 5,
                      ),
                      Text('ACTIVE TRANSPORTERS',
                          style:
                              TextStyle(color: signInColor, fontSize: size_18))
                    ]))),
        SizedBox(width: safeBlockHorizontal * 20),
        Card(
            shadowColor: black,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_25)),
            child: Container(
                height: safeBlockVertical * 108,
                width: safeBlockHorizontal * 260, //265
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$activeShippers',
                          style: TextStyle(
                              fontSize: size_34,
                              color: activeTransporter,
                              fontWeight: normalWeight)),
                      SizedBox(
                        height: safeBlockVertical * 5,
                      ),
                      Text('ACTIVE SHIPPERS',
                          style:
                              TextStyle(color: signInColor, fontSize: size_18))
                    ])))
      ])
    ]);
  }
}
