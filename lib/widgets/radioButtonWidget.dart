import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

// ignore: must_be_immutable
class RadioButtonWidget extends StatefulWidget {
  String type;
  RadioButtonWidget({required this.type});
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  ShipperController? shipperController;
  TransporterController? transporterController;

  setSelectedRadio(int val) {
    setState(() {
      if (widget.type == "ShipperApproval") {
        shipperController!.updateOnShipperApproval(val);
      } else if (widget.type == "ShipperAccountVerification") {
        shipperController!.updateShipperAccountVerification(val);
      } else if (widget.type == "TransporterApproval") {
        transporterController!.updateOnTransporterApproval(val);
      } else {
        transporterController!.updateCompanyProofApproval(val);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type.startsWith("Shipper")) {
      shipperController = Get.find<ShipperController>();
    } else if (widget.type.startsWith("Transporter")) {
      transporterController = Get.find<TransporterController>();
    }
    return Row(children: [
      Radio(
          activeColor: black,
          value: 1,
          groupValue: widget.type.startsWith("Shipper")
              ? (widget.type == "ShipperApproval"
                  ? shipperController!.shipperApprovalStatus.value
                  : shipperController!
                      .shipperAccountVerficationInProgress.value)
              : (widget.type == "TransporterApproval"
                  ? transporterController!.transporterApprovalStatus.value
                  : transporterController!.companyProofApproval.value),
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: width * 60,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: widget.type.endsWith("Approval")
                  ? Text('Verified', style: TextStyle(color: black, fontFamily: 'montserrat'))
                  : Text('Verified', style: TextStyle(color: black, fontFamily: 'montserrat')))),
      SizedBox(width: width * 20),
      Radio(
          activeColor: black,
          value: 2,
          groupValue: widget.type.startsWith("Shipper")
              ? (widget.type == "ShipperApproval"
                  ? shipperController!.shipperApprovalStatus.value
                  : shipperController!.shipperAccountVerficationInProgress.value)
              : (widget.type == "TransporterApproval"
                  ? transporterController!.transporterApprovalStatus.value
                  : transporterController!.companyProofApproval.value),
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: width * 90,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: widget.type.endsWith("Approval")
                  ? Text('Not Verified', style: TextStyle(color: black, fontFamily: 'montserrat'))
                  : Text('Not Verified', style: TextStyle(color: black, fontFamily: 'montserrat'))))
    ]);
  }
}
