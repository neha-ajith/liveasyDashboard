import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/widgets/approveButtonWidget.dart';
import 'package:liveasy_admin/widgets/rejectButtonWidget.dart';

// ignore: must_be_immutable
class IDProofLayout extends StatelessWidget {
  String? pan;
  IDProofLayout({required this.pan});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 242,
        width: width * 270,
        padding: EdgeInsets.only(left: width * 30, top: height * 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: height * 17,
              width: width * 79,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text('ID Proof',
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: boldWeight,
                          fontSize: 15)))),
          if (pan != null)
            Container(
                width: width * 210,
                height: height * 130,
                child: FittedBox(fit: BoxFit.cover, child: Image.network(pan!)))
          else
            Center(child: Text('No Image')),
          SizedBox(height: height * 15),
          Row(children: [
            SizedBox(width: width * 12),
            ApproveButtonWidget(type: 'pan'),
            SizedBox(width: width * 30),
            RejectButtonWidget(type: 'pan')
          ])
        ]),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(radius_10),
            border: Border.all(color: greyColor.withOpacity(0.80))));
  }
}

// ignore: must_be_immutable
class AddressProofLayout extends StatelessWidget {
  String? aadhar1, aadhar2;
  AddressProofLayout({required this.aadhar1, required this.aadhar2});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 243,
      width: width * 521,
      padding: EdgeInsets.only(top: height * 20, left: width * 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Address Proof",
            style: TextStyle(
                color: black, fontSize: 16, fontWeight: regularWeight)),
        Row(children: [
          if (aadhar1 != null)
            Container(
                width: width * 210,
                height: height * 130,
                child: Image.network(aadhar1!))
          else
            Center(child: Text("NO Image")),
          SizedBox(height: height * 25),
          if (aadhar2 != null)
            Container(
                width: width * 210,
                height: height * 130,
                child: Image.network(aadhar2!))
          else
            Center(child: Text("NO Image")),
        ]),
        SizedBox(height: height * 15),
        Row(children: [
          SizedBox(width: width * 17),
          ApproveButtonWidget(type: 'Aadhar1'),
          SizedBox(width: width * 30),
          RejectButtonWidget(type: 'Aadhar1'),
          SizedBox(width: width * 60),
          ApproveButtonWidget(type: 'Aadhar2'),
          SizedBox(width: width * 30),
          RejectButtonWidget(type: 'Aadhar2')
        ])
      ]),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(radius_10),
          border: Border.all(color: greyColor.withOpacity(0.80))),
    );
  }
}

// ignore: must_be_immutable
class CompanyProofLayout extends StatelessWidget {
  String? gst;
  CompanyProofLayout({required this.gst});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 662,
      width: height * 504,
      padding: EdgeInsets.only(top: height * 20, left: width * 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Company ID Proof",
            style: TextStyle(
                color: black, fontSize: 16, fontWeight: regularWeight)),
        SizedBox(height: height * 20),
        if (gst != null)
          Container(
              width: width * 412,
              height: height * 545,
              child: Image.network(gst!))
        else
          Center(child: Text("NO Image")),
        SizedBox(height: height * 15),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ApproveButtonWidget(type: 'gst'),
          SizedBox(width: width * 30),
          RejectButtonWidget(type: 'gst')
        ])
      ]),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(radius_10),
          border: Border.all(color: greyColor.withOpacity(0.80))),
    );
  }
}
