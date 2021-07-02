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
import 'package:liveasy_admin/constants/screenSize.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  var userData;
  HomeScreen({Key? key, required this.userData}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
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
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: signInColor,
                toolbarHeight: safeBlockVertical * height_45,
                leading: Row(children: [
                  SizedBox(width: safeBlockHorizontal * width_26),
                  Image.asset('icons/liveasy_logo_white.png',
                      width: safeBlockHorizontal * width_19,
                      height: safeBlockVertical * height_30)
                ]),
                titleSpacing: safeBlockHorizontal * width_10,
                title: Text('Liveasy',
                    style: TextStyle(
                        color: white,
                        fontSize: size_20,
                        fontWeight: boldWeight)),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.search), iconSize: 17),
                  SizedBox(width: safeBlockHorizontal * width_19),
                  Center(child: Text("admin")),
                  SizedBox(width: safeBlockHorizontal * width_10),
                  Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                          iconSize: 18)),
                  SizedBox(width: safeBlockHorizontal * width_50)
                ]),
            body: Row(children: [
              Card(
                  elevation: 1.5,
                  shadowColor: black,
                  child: Container(
                    width: safeBlockHorizontal * width_238,
                    child: listDrawerItems(false),
                  )),
              tabController.index == 0
                  ? SizedBox(width: safeBlockHorizontal * width_41)
                  : SizedBox(width: safeBlockHorizontal * width_25),
              Container(
                  width: tabController.index == 0
                      ? safeBlockHorizontal * dashboardWidth
                      : safeBlockHorizontal * width_1177,
                  height: safeBlockVertical * height_979,
                  child: TabBarView(controller: tabController, children: [
                    Dashboard(),
                    ShipperDetailsScreen(),
                    ShipperActivitiesScreen(),
                    TransporterDetailsScreen(),
                    TransporterActivitiesScreen(),
                    GPSDetailsScreen()
                  ]))
            ])));
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(children: <Widget>[
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
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
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.speed_outlined, size: 20, color: greyColor),
                    SizedBox(
                      width: safeBlockHorizontal * width_10,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16),
                    )
                  ])))),
      Divider(color: greyColor.withOpacity(0.10), thickness: borderWidth_1),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
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
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.card_giftcard_outlined,
                        size: 14, color: greyColor),
                    SizedBox(
                      width: safeBlockVertical * width_10,
                    ),
                    Text(
                      "Shipper details",
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16),
                    )
                  ])))),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
              backgroundColor: tabController.index == 2
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.note_sharp, size: 14, color: greyColor),
                    SizedBox(
                      width: safeBlockVertical * width_10,
                    ),
                    Text("Shipper activities",
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16,
                        ))
                  ])))),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
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
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.car_repair, size: 14, color: greyColor),
                    SizedBox(
                      width: safeBlockVertical * width_10,
                    ),
                    Text("Transporter details",
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16,
                        ))
                  ])))),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
              backgroundColor: tabController.index == 4
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController.animateTo(4);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.note, size: 14, color: greyColor),
                    SizedBox(
                      width: safeBlockVertical * width_10,
                    ),
                    Text("Transporter activities",
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16,
                        ))
                  ])))),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(safeBlockHorizontal * width_238,
                  safeBlockVertical * height_30),
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
                  padding:
                      EdgeInsets.only(left: safeBlockHorizontal * width_20),
                  child: Row(children: [
                    Icon(Icons.gps_fixed, size: 14, color: greyColor),
                    SizedBox(
                      width: safeBlockVertical * width_10,
                    ),
                    Text("GPS details",
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: normalWeight,
                          fontSize: size_16,
                        ))
                  ]))))
    ]);
  }
}
