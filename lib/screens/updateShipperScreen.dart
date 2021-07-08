import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/functions/getDocument.dart';
import 'package:liveasy_admin/models/documentApiModel.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/widgets/acceptButtonWidget.dart';
import 'package:liveasy_admin/widgets/rejectButtonWidget.dart';

class UpdateShipperScreen extends StatefulWidget {
  final ShipperDetailsModel shipperDetails;
  UpdateShipperScreen({Key? key, required this.shipperDetails})
      : super(key: key);

  @override
  _UpdateShipperScreenState createState() => _UpdateShipperScreenState();
}

class _UpdateShipperScreenState extends State<UpdateShipperScreen> {
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController companyName = TextEditingController();
  String? adhar1, adhar2, pan, gst;
  bool _isNameEditable = false;
  bool _isLocationEditable = false;
  bool _isCompanyNameEditable = false;

  @override
  void initState() async {
    super.initState();
    final List<DocumentModel> docList =
        await runGetDocumentsApi(widget.shipperDetails.shipperId!);
    for (var document in docList) {
      switch (document.documentType) {
        case "Aadhar1":
          {
            adhar1 = document.documentLink;
          }
          break;
        case "Adhar2":
          {
            adhar2 = document.documentLink;
          }
          break;
        case "PAN":
          {
            pan = document.documentLink;
          }
          break;
        case "GST":
          {
            gst = document.documentLink;
          }
      }
    }
  }

  _buildTextField(
      String labelText, TextEditingController controller, bool? editable) {
    return Container(
        height: safeBlockVertical * 40,
        width: safeBlockHorizontal * 220,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: greyColor.withOpacity(0.80))),
        child: Row(children: [
          Container(
            height: safeBlockVertical * 40,
            width: labelText == "Contact"
                ? safeBlockHorizontal * 215
                : safeBlockHorizontal * 175,
            padding: EdgeInsets.only(
                left: safeBlockHorizontal * 20,
                top: safeBlockVertical * 8,
                bottom: safeBlockVertical * 8),
            child: TextField(
              enabled: editable,
              textInputAction: TextInputAction.next,
              controller: controller,
              style: TextStyle(
                  color: black, fontSize: 10, fontWeight: normalWeight),
              decoration: InputDecoration(
                  hintText: controller.text == "" ? labelText : null,
                  hintStyle: TextStyle(
                      fontSize: 11, fontWeight: regularWeight, color: black),
                  border: InputBorder.none),
            ),
          ),
          if (labelText != "Contact")
            IconButton(
                onPressed: () {
                  setState(() {
                    switch (labelText) {
                      case "Name":
                        {
                          _isNameEditable = true;
                        }
                        break;
                      case "Location":
                        {
                          _isLocationEditable = true;
                        }
                        break;
                      case "Company Name":
                        {
                          _isCompanyNameEditable = true;
                        }
                    }
                  });
                },
                icon: Icon(Icons.mode_edit_outline_outlined, size: 9))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    name
      ..text = widget.shipperDetails.shipperName == null
          ? ""
          : widget.shipperDetails.shipperName!;
    contact..text = widget.shipperDetails.phoneNo.toString();
    location.text = widget.shipperDetails.shipperLocation == null
        ? ""
        : widget.shipperDetails.shipperLocation!;
    companyName.text = widget.shipperDetails.companyName == null
        ? ""
        : widget.shipperDetails.companyName!;
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: safeBlockVertical * 37),
      Text('Shipper details',
          style: TextStyle(
              fontSize: size_32, color: greyColor, fontWeight: regularWeight)),
      SizedBox(height: safeBlockVertical * 29),
      Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_30)),
          shadowColor: black,
          elevation: 2.0,
          child: Container(
            width: safeBlockHorizontal * 1137,
            // height: safeBlockVertical * 1500,
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
                Center(
                    child: Icon(Icons.person_outline,
                        size: 50)), //Image.asset('')),
                SizedBox(height: safeBlockVertical * 42),
                Row(children: [
                  Text('Name',
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: boldWeight,
                          fontSize: 11)),
                  SizedBox(width: safeBlockHorizontal * 212),
                  Text('Contact',
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: boldWeight,
                          fontSize: 11)),
                  SizedBox(width: safeBlockHorizontal * 212),
                  Text('Location',
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: boldWeight,
                          fontSize: 11))
                ]),
                SizedBox(height: safeBlockVertical * 10),
                Row(children: [
                  _buildTextField("Name", name, _isNameEditable),
                  SizedBox(width: safeBlockHorizontal * 53),
                  _buildTextField("Contact", contact, null),
                  SizedBox(width: safeBlockHorizontal * 53),
                  _buildTextField("Location", location, _isLocationEditable)
                ]),
                SizedBox(height: safeBlockVertical * 30),
                Text('Document image',
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: boldWeight,
                        fontSize: 11)),
                SizedBox(height: safeBlockVertical * 15),
                Row(children: [
                  Container(
                    height: safeBlockVertical * 242,
                    width: safeBlockHorizontal * 270,
                    padding: EdgeInsets.only(
                        left: safeBlockHorizontal * 30,
                        top: safeBlockVertical * 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Identity Proof",
                              style: TextStyle(
                                  color: black,
                                  fontSize: size_16,
                                  fontWeight: regularWeight)),
                          Container(
                              width: safeBlockHorizontal * 210,
                              height: safeBlockVertical * 130,
                              child:
                                  //Image.network(pan!)
                                  Icon(Icons.person_outline)),
                          SizedBox(height: safeBlockVertical * 15),
                          Row(
                            children: [
                              SizedBox(width: safeBlockHorizontal * 12),
                              AcceptButtonWidget(type: 'pan'),
                              SizedBox(width: safeBlockHorizontal * 30),
                              RejectButtonWidget(type: 'pan')
                            ],
                          )
                        ]),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(radius_10),
                        border: Border.all(color: greyColor.withOpacity(0.80))),
                  ),
                  SizedBox(width: safeBlockHorizontal * 65),
                  Container(
                    height: safeBlockVertical * 243,
                    width: safeBlockHorizontal * 521,
                    padding: EdgeInsets.only(
                        top: safeBlockVertical * 20,
                        left: safeBlockHorizontal * 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address Proof",
                            style: TextStyle(
                                color: black,
                                fontSize: size_16,
                                fontWeight: regularWeight)),
                        Row(children: [
                          Container(
                              width: safeBlockHorizontal * 210,
                              height: safeBlockVertical * 130,
                              child: Icon(Icons
                                  .person_outline)), //Image.network(adhar1!),
                          SizedBox(height: safeBlockVertical * 25),
                          Container(
                              width: safeBlockHorizontal * 210,
                              height: safeBlockVertical * 130,
                              child: Icon(Icons
                                  .person_outline)), //Image.network(adhar2!)
                        ]),
                        SizedBox(height: safeBlockVertical * 15),
                        Row(
                          children: [
                            SizedBox(width: safeBlockHorizontal * 17),
                            AcceptButtonWidget(type: 'Aadhar1'),
                            SizedBox(width: safeBlockHorizontal * 30),
                            RejectButtonWidget(type: 'Aadhar1'),
                            SizedBox(width: safeBlockHorizontal * 60),
                            AcceptButtonWidget(type: 'Aadhar2'),
                            SizedBox(width: safeBlockHorizontal * 30),
                            RejectButtonWidget(type: 'Aadhar2'),
                          ],
                        )
                      ],
                    ),
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
                        fontSize: 10)),
                SizedBox(height: safeBlockVertical * 15),
                _buildTextField(
                    "Company Name", companyName, _isCompanyNameEditable),
                SizedBox(height: safeBlockVertical * 30),
                Text('Company Details',
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: boldWeight,
                        fontSize: 10)),
                SizedBox(height: safeBlockVertical * 15),
                Container(
                  height: safeBlockVertical * 662,
                  width: safeBlockVertical * 504,
                  padding: EdgeInsets.only(
                      top: safeBlockVertical * 20,
                      left: safeBlockHorizontal * 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Company ID Proof",
                            style: TextStyle(
                                color: black,
                                fontSize: size_16,
                                fontWeight: regularWeight)),
                        SizedBox(height: safeBlockVertical * 20),
                        Container(
                            width: safeBlockHorizontal * 412,
                            height: safeBlockVertical * 545,
                            child:
                                //Image.network(pan!)
                                Icon(Icons.person_outline)),
                        SizedBox(height: safeBlockVertical * 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: safeBlockHorizontal * 160),
                            AcceptButtonWidget(type: 'gst'),
                            SizedBox(width: safeBlockHorizontal * 30),
                            RejectButtonWidget(type: 'gst')
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(radius_10),
                      border: Border.all(color: greyColor.withOpacity(0.80))),
                ),
                SizedBox(height: safeBlockHorizontal * 35),
                Center(
                    child: Container(
                  height: safeBlockVertical * 31,
                  width: safeBlockHorizontal * 165,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: tabSelection),
                          borderRadius: BorderRadius.circular(radius_25)),
                      color: tabSelection,
                      onPressed: () {},
                      child: Text('Save Changes',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: greyColor,
                              fontSize: size_16,
                              fontWeight: regularWeight))),
                ))
              ],
            ),
          )),
    ]));
  }
}
