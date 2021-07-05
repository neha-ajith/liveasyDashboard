import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
//import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

class UpdateShipperScreen extends StatefulWidget {
  final List shipperDetails = [];
  UpdateShipperScreen({Key? key, required shipperDetails}) : super(key: key);

  @override
  _UpdateShipperScreenState createState() => _UpdateShipperScreenState();
}

class _UpdateShipperScreenState extends State<UpdateShipperScreen> {
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;

  _buildTextField(String labelText) {
    return Container(
        height: safeBlockVertical * 30,
        width: safeBlockHorizontal * 219,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(radius_10),
            border: Border.all(color: greyColor.withOpacity(0.80))),
        child: Row(children: [
          Container(
            height: safeBlockVertical * 30,
            width: safeBlockHorizontal * 219,
            padding: EdgeInsets.only(
                left: safeBlockHorizontal * 20,
                top: safeBlockVertical * 6,
                bottom: safeBlockVertical * 6),
            child: TextField(
//              focusNode: focusNode,
              textInputAction: TextInputAction.next,
//              controller: controller,
              style: TextStyle(
                  color: black, fontSize: size_12, fontWeight: normalWeight),
              decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(
                      fontSize: size_12,
                      fontWeight: regularWeight,
                      color: black),
                  border: InputBorder.none),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons
                  .mode_edit_outline_outlined)) //Edit to update logic pending
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: safeBlockVertical * 37),
      Text('Shipper details',
          style: TextStyle(
              fontSize: size_32, color: greyColor, fontWeight: regularWeight)),
      SizedBox(height: safeBlockVertical * 29),
      Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_25)),
          shadowColor: black,
          elevation: 2.0,
          child: Container(
            width: safeBlockHorizontal * 1137,
            height: safeBlockVertical * 1500,
            padding: EdgeInsets.only(
                top: safeBlockVertical * 46, left: safeBlockHorizontal * 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Edit information',
                    style: TextStyle(
                        fontSize: size_28,
                        color: greyColor,
                        fontWeight: regularWeight)),
                SizedBox(height: safeBlockVertical * 35),
                Center(child: Image.asset('')),
                SizedBox(height: safeBlockVertical * 43),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Name',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: boldWeight,
                              fontSize: size_12)),
                      Text('Contact',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: boldWeight,
                              fontSize: size_12)),
                      Text('Address',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: boldWeight,
                              fontSize: size_12)),
                      Text('Location',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: boldWeight,
                              fontSize: size_12))
                    ]),
                SizedBox(height: safeBlockVertical * 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTextField("Name"),
                      _buildTextField("Contact"),
                      _buildTextField("Address"),
                      _buildTextField("Location"),
                    ]),
                SizedBox(height: safeBlockVertical * 30),
                Text('Document image',
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: boldWeight,
                        fontSize: size_12)),
                SizedBox(height: safeBlockVertical * 15),
                Row(children: [
                  Container(
                    height: safeBlockVertical * 243,
                    width: safeBlockVertical * 270,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(radius_10),
                        border: Border.all(color: greyColor.withOpacity(0.80))),
                  ),
                  Container(
                    height: safeBlockVertical * 243,
                    width: safeBlockVertical * 270,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(radius_10),
                        border: Border.all(color: greyColor.withOpacity(0.80))),
                  )
                ]),
                SizedBox(height: safeBlockVertical * 30),
                Text('Document image',
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: boldWeight,
                        fontSize: size_12)),
                SizedBox(height: safeBlockVertical * 15),
                _buildTextField("Company Name"),
                SizedBox(height: safeBlockVertical * 30),
                Text('Company Details',
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: boldWeight,
                        fontSize: size_12)),
                SizedBox(height: safeBlockVertical * 15),
                Container(
                  height: safeBlockVertical * 662,
                  width: safeBlockVertical * 504,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(radius_10),
                      border: Border.all(color: greyColor.withOpacity(0.80))),
                ),
                Center(
                    child: Container(
                  height: safeBlockVertical * 31,
                  width: safeBlockHorizontal * 165,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: tabSelection),
                          borderRadius: BorderRadius.circular(radius_25)),
                      color: signInColor,
                      onPressed: () {},
                      child: Text('Save Changes',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: black,
                              fontSize: size_22,
                              fontWeight: regularWeight))),
                ))
              ],
            ),
          )),
    ]));
  }
}
