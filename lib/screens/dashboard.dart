import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  int? visitorsOnSite; //TODO: Data Source
  int? appDownloads;
  int? activeTransporters;
  int? activeShippers;

  @override
  Widget build(BuildContext context) {
    visitorsOnSite = 449;
    appDownloads = 449;
    activeTransporters = 449;
    activeShippers = 449;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 37),
          Container(
              height: height * 40,
              width: width * 178,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text('Dashboard',
                    style: TextStyle(
                        fontSize: 32,
                        color: greyColor,
                        fontWeight: regularWeight)),
              )),
          SizedBox(height: height * 40),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius_3+1)),
                shadowColor: black,
                elevation: 2.0,
                child: Container(
                    height: height * 108,
                    width: width * 265,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: height * 41,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text('$visitorsOnSite',
                                      style: TextStyle(
                                          fontSize: 34,
                                          color: visitor,
                                          fontWeight: mediumBoldWeight)))),
                          SizedBox(height: height * 5),
                          Container(
                              height: height * 22,
                              width: width * 164,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('VISITORS ON SITE',
                                      style: TextStyle(
                                          color: signInColor,
                                          fontSize: 18,
                                          fontWeight: normalWeight))))
                        ]))),
            SizedBox(width: width * 20),
            Card(
                shadowColor: black,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius_3+1)),
                child: Container(
                    height: height * 108,
                    width: width * 265,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: height * 41,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text('$appDownloads',
                                      style: TextStyle(
                                          fontSize: 34,
                                          color: appDownload,
                                          fontWeight: mediumBoldWeight)))),
                          SizedBox(height: height * 5),
                          Container(
                              height: height * 22,
                              width: width * 172,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('APP DOWNLOADS',
                                      style: TextStyle(
                                          color: signInColor,
                                          fontSize: 18,
                                          fontWeight: normalWeight))))
                        ]))),
            SizedBox(width: width * 20),
            Card(
                shadowColor: black,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius_3+1)),
                child: Container(
                    height: height * 108,
                    width: width * 266,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: height * 41,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text('$activeTransporters',
                                      style: TextStyle(
                                          fontSize: 34,
                                          color: activeTransporter,
                                          fontWeight: mediumBoldWeight)))),
                          SizedBox(height: height * 5),
                          Container(
                              height: height * 22,
                              width: width * 210,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('ACTIVE TRANSPORTER',
                                      style: TextStyle(
                                          color: signInColor,
                                          fontSize: 18,
                                          fontWeight: normalWeight))))
                        ]))),
            SizedBox(width: width * 20),
            Card(
                shadowColor: black,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius_3+1)),
                child: Container(
                    height: height * 108,
                    width: width * 265,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: height * 41,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text('$activeShippers',
                                      style: TextStyle(
                                          fontSize: 34,
                                          color: activeShipper,
                                          fontWeight: mediumBoldWeight)))),
                          SizedBox(height: height * 5),
                          Container(
                              height: height * 22,
                              width: width * 153,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('ACTIVE SHIPPER',
                                      style: TextStyle(
                                          color: signInColor,
                                          fontSize: 18,
                                          fontWeight: normalWeight))))
                        ]))),
          ])
        ]);
  }
}
