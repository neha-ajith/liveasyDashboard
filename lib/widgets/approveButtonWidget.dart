import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

// ignore: must_be_immutable
class ApproveButtonWidget extends StatelessWidget {
  String type;
  String docType;
  ApproveButtonWidget({required this.type, required this.docType});
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
                backgroundColor: signInColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: signInColor),
                    borderRadius: BorderRadius.circular(radius_3+1))),
            onPressed: () {
              if (type == "Shipper") {
                controller = Get.find<ShipperController>();
              } else {
                controller = Get.find<TransporterController>();
              }
              switch (docType) {
                case "PAN":
                  controller!.updateIdentityProofApprovalStatus(true);
                  break;
                case "AadharFront":
                  controller!.updateAddressProofFrontApprovalStatus(true);
                  break;
                case "AadharBack":
                  controller!.updateAddressProofBackApprovalStatus(true);
                  break;
                case "GST":
                  controller!.updateCompanyProofApprovalStatus(true);
                  break;
              }
            },
            child: Container(
                height: docType == "GST" ? height * 15 : height * 12,
                width: docType == "GST" ? width * 47 : width * 42,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text('Approve',
                        style: TextStyle(
                            color: white,
                            fontSize: 10,
                            fontWeight: regularWeight))))));
  }
}
