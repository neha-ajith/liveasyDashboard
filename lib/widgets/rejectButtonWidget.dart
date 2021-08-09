import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

// ignore: must_be_immutable
class RejectButtonWidget extends StatelessWidget {
  String type;
  String docType;
  RejectButtonWidget({required this.type, required this.docType});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  var controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: docType == "GST" ? width * 88 : width * 78,
      height: docType == "GST" ? height * 52 : height * 46,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: white,
              fixedSize: Size(width * 78, height * 26),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: black),
                  borderRadius: BorderRadius.circular(radius_3+1))),
          onPressed: () {
            if (type == "Shipper") {
              controller = Get.find<ShipperController>();
            } else {
              controller = Get.find<TransporterController>();
            }
            switch (docType) {
              case "PAN":
                controller!.updateIdentityProofApprovalStatus(false);
                break;
              case "AadharFront":
                controller!.updateAddressProofFrontApprovalStatus(false);
                break;
              case "AadharBack":
                controller!.updateAddressProofBackApprovalStatus(false);
                break;
              case "GST":
                controller!.updateCompanyProofApprovalStatus(false);
                break;
            }
          },
          child: Container(
              height: type == "GST" ? height * 15 : height * 12,
              width: type == "GST" ? width * 39 : width * 34,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text('Reject',
                      style: TextStyle(
                          color: greyColor,
                          fontSize: 10,
                          fontWeight: regularWeight))))),
    );
  }
}
