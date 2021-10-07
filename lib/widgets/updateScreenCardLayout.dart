import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/approveButtonWidget.dart';
import 'package:liveasy_admin/widgets/rejectButtonWidget.dart';

// ignore: must_be_immutable
class DocumentImageLayout extends StatelessWidget {
  String type;
  String? pan, aadhar1, aadhar2;
  bool panApproved, aadhar1Approved, aadhar2Approved;
  DocumentImageLayout(
      {required this.type,
      required this.pan,
      required this.aadhar1,
      required this.aadhar2,
      required this.panApproved,
      required this.aadhar1Approved,
      required this.aadhar2Approved});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: height * 280,
          width: width * 270,
          padding: EdgeInsets.only(
              left: width * 30, top: height * 20, right: width * 30),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(radius_2-2),
              border: Border.all(color: greyColor.withOpacity(0.80))),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: height * 17,
                width: width * 62,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text('ID Proof',
                        style: TextStyle(color: greyColor, fontWeight: normalWeight, fontSize: 15)))),
            SizedBox(height: height * 20),
            pan != null
                ? Container(width: width * 210, height: height * 140, child: Image.network(pan!, fit: BoxFit.fill,))
                : Container(width: width * 210, height: height * 140, child: Center(child: Text('NO Image Uploaded'))),
            if (pan != null)
              Column(children: [
                SizedBox(height: height * 15),
                !panApproved
                    ? Center(child: ApproveButtonWidget(type: type, docType: 'PAN'))
                    : Center(child: RejectButtonWidget(type: type, docType: 'PAN'))
              ])
          ])),
      SizedBox(width: width * 120),
      Container(
          height: height * 280,
          width: width * 521,
          padding: EdgeInsets.only(
              top: height * 20, left: width * 30, right: width * 40),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(radius_10),
              border: Border.all(color: greyColor.withOpacity(0.80))),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: height * 17,
                width: width * 110,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text("Address Proof",
                        style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: regularWeight)))),
            SizedBox(height: height * 20),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              if (aadhar1 != null)
                Container(
                    width: width * 210,
                    height: height * 140,
                    child: Image.network(
                      aadhar1!, fit: BoxFit.cover,
                    ))
              //FittedBox(fit: BoxFit.cover, child: Image.network(aadhar1!)))
              else
                Container(
                    height: height * 140,
                    width: width * 210,
                    child: Center(child: Text("NO Image Uploaded"))),
              SizedBox(width: width * 20),
              if (aadhar2 != null)
                Container(
                    width: width * 210,
                    height: height * 140,
                    child: Image.network(
                      aadhar2!, fit: BoxFit.cover,
                    ))
              //  FittedBox(fit: BoxFit.cover, child: Image.network(aadhar2!)))
              else
                Container(
                    height: height * 140,
                    width: width * 210,
                    child: Center(child: Text("NO Image Uploaded")))
            ]),
            SizedBox(height: height * 15),
            if (aadhar1 != null && aadhar2 != null)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (!aadhar1Approved)
                  ApproveButtonWidget(type: type, docType: 'AadharFront')
                else
                  RejectButtonWidget(type: type, docType: 'AadharFront'),
                SizedBox(width: width * 159),
                if (!aadhar2Approved)
                  ApproveButtonWidget(type: type, docType: 'AadharBack')
                else
                  RejectButtonWidget(type: type, docType: 'AadharBack')
              ])
          ]))
    ]);
  }
}

// ignore: must_be_immutable
class CompanyProofLayout extends StatelessWidget {
  String? gst;
  bool? companyProofApproved;
  CompanyProofLayout({required this.gst, required this.companyProofApproved});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 705,
        width: width * 504,
        padding: EdgeInsets.only(
            top: height * 20, left: width * 45, right: width * 45),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(radius_10),
            border: Border.all(color: greyColor.withOpacity(0.80))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: height * 17,
              width: width * 141,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text("Company ID Proof",
                      style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: regularWeight)))),
          SizedBox(height: height * 20),
          if (gst != null)
            Container(
                width: width * 412,
                height: height * 545,
                child: Image.network(
                  gst!, fit: BoxFit.cover,
                ))
          //FittedBox(fit: BoxFit.cover, child: Image.network(gst!)))
          else
            Container(
                height: height * 545,
                width: width * 412,
                child: Center(child: Text("NO Image Uploaded"))),
          if (gst != null)
            Column(children: [
              SizedBox(height: height * 15),
              if (!companyProofApproved!)
                Center(
                    child: ApproveButtonWidget(
                      type: 'Shipper',
                      docType: 'GST',
                    ))
              else
                Center(
                    child:
                    RejectButtonWidget(type: 'ShipperGST', docType: 'GST'))
            ])
        ]));
  }
}