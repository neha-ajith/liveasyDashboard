import 'package:flutter/material.dart';
import 'package:liveasy_admin/screens/dashboard.dart';
import 'package:liveasy_admin/screens/shipperDetailsScreen.dart';
import 'package:liveasy_admin/screens/shipperActivities.dart';
import 'package:liveasy_admin/screens/transporterDetailsScreen.dart';
import 'package:liveasy_admin/screens/transporterActivitiesScreen.dart';
import 'package:liveasy_admin/screens/gpsDetailsScreen.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  List<String> userData;
  HomeScreen({Key? key, required this.userData}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int active = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 6, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.mediaQueryData == null) {
      SizeConfig().init(context);
    }
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
    double safeBlockVertical = SizeConfig.safeBlockVertical!;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: signInColor,
                toolbarHeight: safeBlockVertical * 45,
                leading: Row(children: [
                  SizedBox(width: safeBlockHorizontal * 23),
                  Image.asset('icons/liveasy_logo_white.png',
                      width: safeBlockHorizontal * 25,
                      height: safeBlockVertical * 25)
                ]),
                titleSpacing: safeBlockHorizontal * 10,
                title: Text('Liveasy',
                    style: TextStyle(
                        color: white,
                        fontSize: size_20,
                        fontWeight: boldWeight)),
                actions: [
                  IconButton(
                      onPressed: () {}, // Search Logic pending
                      icon: Icon(Icons.search),
                      iconSize: 17),
                  SizedBox(width: safeBlockHorizontal * 19),
                  Center(child: Text("admin")),
                  SizedBox(width: safeBlockHorizontal * 10),
                  Center(
                      child: IconButton(
                          onPressed:
                              () {}, //Admin Account settings like Sign Out Button
                          icon: Icon(Icons.person),
                          iconSize: 25)),
                  SizedBox(width: safeBlockVertical * 45)
                ]),
            body: Row(children: [
              Card(
                  elevation: 1.5,
                  shadowColor: black,
                  child: Container(
                    width: safeBlockHorizontal * 238,
                    child: listDrawerItems(false),
                  )),
              tabController.index == 0
                  ? SizedBox(width: safeBlockHorizontal * 41)
                  : SizedBox(width: safeBlockHorizontal * 25),
              Container(
                  width: tabController.index == 0
                      ? safeBlockHorizontal * 1152 //1161 TODO:Unknown Error
                      : safeBlockHorizontal * 1167, //1177 TODO: Unknown Error
                  height: safeBlockVertical * 979,
                  child: TabBarView(controller: tabController, children: [
                    Dashboard(),
                    ShipperDetailsScreen(),
                    ShipperActivitiesScreen(), //TODO: These Screens are empty
                    TransporterDetailsScreen(),
                    TransporterActivitiesScreen(),
                    GPSDetailsScreen()
                  ]))
            ])));
  }

  Widget listDrawerItems(bool drawerStatus) {
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
    double safeBlockVertical = SizeConfig.safeBlockVertical!;
    return ListView(children: <Widget>[
      SizedBox(height: safeBlockVertical * 30),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 0
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                child: Row(children: [
                  Icon(Icons.speed_outlined, size: 14, color: greyColor),
                  SizedBox(
                    width: safeBlockHorizontal * 10,
                  ),
                  Text("Dashboard",
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16)),
                ])),
          )),
      SizedBox(height: safeBlockVertical * 3),
      Divider(color: greyColor.withOpacity(0.10), thickness: borderWidth_1),
      SizedBox(height: safeBlockVertical * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 1
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                child: Row(children: [
                  Icon(Icons.card_giftcard_outlined,
                      size: 14, color: greyColor),
                  SizedBox(
                    width: safeBlockVertical * 10,
                  ),
                  Text("Shipper details",
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16)),
                ])),
          )),
      SizedBox(height: safeBlockVertical * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 2
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                      width: safeBlockHorizontal * 210,
                      padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                      child: Row(children: [
                        Icon(Icons.note_sharp, size: 14, color: greyColor),
                        SizedBox(
                          width: safeBlockVertical * 10,
                        ),
                        Text("Shipper activities",
                            style: TextStyle(
                              color: greyColor,
                              fontWeight: normalWeight,
                              fontSize: size_16,
                            )),
                      ])),
                  Icon(Icons.chevron_right_outlined, size: 10),
                ],
              ))),
      SizedBox(height: safeBlockVertical * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 3
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(3);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                child: Row(children: [
                  Icon(Icons.car_repair, size: 14, color: greyColor),
                  SizedBox(
                    width: safeBlockVertical * 10,
                  ),
                  Text("Transporter details",
                      style: TextStyle(
                        color: greyColor,
                        fontWeight: normalWeight,
                        fontSize: size_16,
                      )),
                ])),
          )),
      SizedBox(height: safeBlockVertical * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 4
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(4);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                      width: safeBlockHorizontal * 210,
                      padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                      child: Row(children: [
                        Icon(Icons.note, size: 14, color: greyColor),
                        SizedBox(
                          width: safeBlockVertical * 10,
                        ),
                        Text("Transporter activities",
                            style: TextStyle(
                              color: greyColor,
                              fontWeight: normalWeight,
                              fontSize: size_16,
                            )),
                      ])),
                  Icon(Icons.chevron_right_outlined, size: 10),
                ],
              ))),
      SizedBox(height: safeBlockVertical * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size(safeBlockHorizontal * 238, safeBlockVertical * 35),
              backgroundColor: tabController.index == 5
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(5);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: safeBlockHorizontal * 20),
                child: Row(children: [
                  Icon(Icons.gps_fixed, size: 14, color: greyColor),
                  SizedBox(
                    width: safeBlockVertical * 10,
                  ),
                  Text("GPS details",
                      style: TextStyle(
                        color: greyColor,
                        fontWeight: normalWeight,
                        fontSize: size_16,
                      )),
                ])),
          ))
    ]);
  }
}
