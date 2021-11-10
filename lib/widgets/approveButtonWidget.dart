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
class ApproveButtonWidget extends StatefulWidget {
  String type;
  String docType;
  ApproveButtonWidget({required this.type, required this.docType});

  @override
  State<ApproveButtonWidget> createState() => _ApproveButtonWidgetState();
}

class _ApproveButtonWidgetState extends State<ApproveButtonWidget> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  var controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.docType == "GST" ? width * 88 : width * 78,
        height: widget.docType == "GST" ? height * 52 : height * 46,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: signInColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: signInColor),
                    borderRadius: BorderRadius.circular(radius_3+1))),
            onPressed: () {
              print("${widget.docType}");
              widget.type == "Transporter" ? controller = Get.find<TransporterController>()
                : controller = Get.find<ShipperController>();

              switch(widget.docType){
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
                height: widget.docType == "GST" ? height * 15 : height * 12,
                width: widget.docType == "GST" ? width * 47 : width * 42,
                child: FittedBox(
                    fit: BoxFit.cover, child: Text( 'Approve',
                        style: TextStyle(color: white, fontSize: 10, fontWeight: regularWeight))
                )
            )));
  }
}