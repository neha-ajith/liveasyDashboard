import 'package:flutter/material.dart';
import 'package:liveasy_admin/screens/dashboard.dart';
import 'package:liveasy_admin/screens/shipperDetailsScreen.dart';
import 'package:liveasy_admin/screens/shipperActivities.dart';
import 'package:liveasy_admin/screens/transporterDetailsScreen.dart';
import 'package:liveasy_admin/screens/transporterActivitiesScreen.dart';
import 'package:liveasy_admin/screens/gpsDetailsScreen.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/appBar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  final List<String> userData;
  HomeScreen({required this.userData});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int active = 0;
  //final _myAppBar = MyAppBar();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 6, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController!.index;
        });
      });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.mediaQueryData == null) {
      SizeConfig().init(context);
    }
    double height = SizeConfig.safeBlockVertical!;
    double width = SizeConfig.safeBlockHorizontal!;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(),
            body: Row(children: [
              Card(
                  elevation: 1.5,
                  shadowColor: black,
                  child: Container(
                    width: width * 238,
                    child: listDrawerItems(false),
                  )),
              tabController!.index == 0
                  ? SizedBox(width: width * 31)
                  : SizedBox(width: width * 15),
              Container(
                  width:
                      tabController!.index == 0 ? width * 1161 : width * 1177,
                  height: height * 979,
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        Dashboard(),
                        ShipperDetailsScreen(),
                        ShipperActivitiesScreen(), //TODO: These Screens are empty
                        TransporterDetailsScreen(),
                        TransporterActivitiesScreen(), //TODO: These Screens are empty
                        GPSDetailsScreen() //TODO: These Screens are empty
                      ]))
            ])));
  }

  Widget listDrawerItems(bool drawerStatus) {
    double height = SizeConfig.safeBlockVertical!;
    double width = SizeConfig.safeBlockHorizontal!;
    return ListView(physics: NeverScrollableScrollPhysics(), children: <Widget>[
      SizedBox(height: height * 30),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 0
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(0);
          },
          child: Row(children: [
            SizedBox(width: width * 20),
            Container(
                height: height * 20,
                width: width * 20,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('icons/dashboard.png'))),
            SizedBox(width: width * 10),
            Container(
                height: height * 20,
                width: width * 90,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text("Dashboard",
                        style: TextStyle(
                            color: greyColor,
                            fontWeight: normalWeight,
                            fontSize: 16))))
          ])),
      SizedBox(height: height * 3),
      Divider(color: greyColor.withOpacity(0.10)),
      SizedBox(height: height * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 1
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(1);
          },
          child: Row(children: [
            SizedBox(width: width * 20),
            Container(
                width: width * 20,
                height: height * 20,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('icons/shipper.png'))),
            SizedBox(width: height * 10),
            Container(
                height: height * 17,
                width: width * 107,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text("Shipper details",
                        style: TextStyle(
                            color: greyColor,
                            fontWeight: normalWeight,
                            fontSize: 16))))
          ])),
      SizedBox(height: height * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 2
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(2);
          },
          child: Row(children: [
            Container(
                width: width * 212,
                child: Row(children: [
                  SizedBox(width: width * 20),
                  Container(
                      height: height * 20,
                      width: width * 20,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('icons/activities.png'))),
                  SizedBox(width: height * 10),
                  Container(
                      height: height * 17,
                      width: width * 123,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text("Shipper activities",
                              style: TextStyle(
                                  color: greyColor,
                                  fontWeight: normalWeight,
                                  fontSize: 16))))
                ])),
            Container(
                height: height * 12,
                width: width * 12,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(Icons.chevron_right_outlined)))
          ])),
      SizedBox(height: height * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 3
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(3);
          },
          child: Row(children: [
            SizedBox(width: width * 20),
            Container(
                height: height * 20,
                width: width * 20,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('icons/transporter.png'))),
            SizedBox(width: height * 10),
            Container(
                height: height * 17,
                width: width * 134,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text("Transporter details",
                        style: TextStyle(
                            color: greyColor,
                            fontWeight: normalWeight,
                            fontSize: 16))))
          ])),
      SizedBox(height: height * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 4
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(4);
          },
          child: Row(children: [
            Container(
                width: width * 212,
                child: Row(children: [
                  SizedBox(width: width * 20),
                  Container(
                      height: width * 20,
                      width: height * 20,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('icons/activities.png'))),
                  SizedBox(width: height * 10),
                  Container(
                      height: height * 17,
                      width: width * 150,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text("Transporter activities",
                              style: TextStyle(
                                  color: greyColor,
                                  fontWeight: normalWeight,
                                  fontSize: 16))))
                ])),
            Container(
                height: height * 12,
                width: width * 12,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(Icons.chevron_right_outlined)))
          ])),
      SizedBox(height: height * 10),
      TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(width * 238, height * 35),
              backgroundColor: tabController!.index == 5
                  ? tabSelection.withOpacity(0.20)
                  : white),
          onPressed: () {
            tabController!.animateTo(5);
          },
          child: Row(children: [
            SizedBox(width: width * 20),
            Container(
                height: height * 20,
                width: width * 20,
                child: FittedBox(
                    fit: BoxFit.cover, child: Image.asset('icons/gps.png'))),
            SizedBox(width: height * 10),
            Container(
                height: height * 17,
                width: width * 81,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text("GPS details",
                        style: TextStyle(
                            color: greyColor,
                            fontWeight: normalWeight,
                            fontSize: 16))))
          ]))
    ]);
  }
}
