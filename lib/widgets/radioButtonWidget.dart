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
        transporterController!.updateTransporterAccountVerification(val);
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
                  : transporterController!
                      .transporterAccountVerficationInProgress.value),
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: widget.type.endsWith("Approval") ? width * 65 : width * 90,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: widget.type.endsWith("Approval")
                  ? Text('Approve',
                      style: TextStyle(color: black, fontFamily: 'montserrat'))
                  : Text('Completed',
                      style:
                          TextStyle(color: black, fontFamily: 'montserrat')))),
      SizedBox(width: width * 20),
      Radio(
          activeColor: black,
          value: 2,
          groupValue: widget.type.startsWith("Shipper")
              ? (widget.type == "ShipperApproval"
                  ? shipperController!.shipperApprovalStatus.value
                  : shipperController!
                      .shipperAccountVerficationInProgress.value)
              : (widget.type == "TransporterApproval"
                  ? transporterController!.transporterApprovalStatus.value
                  : transporterController!
                      .transporterAccountVerficationInProgress.value),
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: widget.type.endsWith("Approval") ? width * 60 : width * 90,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: widget.type.endsWith("Approval")
                  ? Text('On Halt',
                      style: TextStyle(color: black, fontFamily: 'montserrat'))
                  : Text('In Progress',
                      style:
                          TextStyle(color: black, fontFamily: 'montserrat'))))
    ]);
  }
}
