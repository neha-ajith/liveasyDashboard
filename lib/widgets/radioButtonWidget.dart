import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

// ignore: must_be_immutable
class RadioButtonWidget extends StatefulWidget {
  String? type;
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
      if (widget.type == "Shipper") {
        shipperController!.updateOnShipperApproval(val);
      } else {
        transporterController!.updateOnTransporterApproval(val);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "Shipper") {
      shipperController = Get.find<ShipperController>();
    } else {
      transporterController = Get.find<TransporterController>();
    }
    return Row(children: [
      Radio(
          activeColor: black,
          value: 1,
          groupValue: widget.type == "Shipper"
              ? shipperController!.onShipperApprove.value
              : transporterController!.onTransporterApprove.value,
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: width * 30,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: Text('Yes',
                  style: TextStyle(color: black, fontFamily: 'montserrat')))),
      SizedBox(width: width * 20),
      Radio(
          activeColor: black,
          value: 2,
          groupValue: widget.type == "Shipper"
              ? shipperController!.onShipperApprove.value
              : transporterController!.onTransporterApprove.value,
          onChanged: (int? val) {
            setSelectedRadio(val!);
          }),
      SizedBox(width: width * 5),
      Container(
          width: width * 25,
          height: height * 20,
          child: FittedBox(
              fit: BoxFit.cover,
              child: Text('No', style: TextStyle(color: black, fontSize: 14))))
    ]);
  }
}
