import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

// ignore: must_be_immutable
class UpdateScreenTextField extends StatefulWidget {
  String type, labelText;
  TextEditingController controller;
  bool editable;
  FocusNode? focusNode;
  UpdateScreenTextField(
      {required this.type,
      required this.labelText,
      required this.controller,
      required this.editable,
      this.focusNode});

  @override
  _UpdateScreenTextFieldState createState() => _UpdateScreenTextFieldState();
}

class _UpdateScreenTextFieldState extends State<UpdateScreenTextField> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  ShipperController? shipperController;
  TransporterController? transporterController;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 60,
        width: widget.labelText == "Name" || widget.labelText == "Company Name"
            ? width * 260
            : (widget.labelText == "Location" ? width * 320 : width * 170),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: greyColor.withOpacity(0.80))),
        child: Row(children: [
          FittedBox(
              fit: BoxFit.cover,
              child: Container(
                  height: height * 20,
                  width: widget.labelText == "Name" ||
                          widget.labelText == "Company Name"
                      ? width * 225
                      : (widget.labelText == "Location"
                          ? width * 285
                          : width * 165),
                  padding: EdgeInsets.symmetric(horizontal: width * 20),
                  child: TextField(
                      focusNode: widget.focusNode,
                      onSubmitted: (value) {
                        if (widget.type == "Shipper") {
                          shipperController = Get.find<ShipperController>();
                          switch (widget.labelText) {
                            case "Name":
                              shipperController!.updateShipperName(value);
                              break;
                            case "Location":
                              shipperController!.updateShipperLocation(value);
                              break;
                            case "Company Name":
                              shipperController!
                                  .updateShipperCompanyName(value);
                              break;
                          }
                        } else {
                          transporterController =
                              Get.find<TransporterController>();
                          switch (widget.labelText) {
                            case "Name":
                              transporterController!
                                  .updateTransporterName(value);
                              break;
                            case "Location":
                              transporterController!
                                  .updateTransporterLocation(value);
                              break;
                            case "Company Name":
                              transporterController!
                                  .updateTransporterCompanyName(value);
                              break;
                          }
                        }
                        widget.focusNode!.unfocus();
                      },
                      enabled: widget.editable,
                      textInputAction: TextInputAction.next,
                      controller: widget.controller,
                      style: TextStyle(color: black, fontWeight: normalWeight),
                      decoration: InputDecoration(
                          hintText: widget.controller.text == ""
                              ? widget.labelText
                              : null,
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: regularWeight,
                              color: black),
                          border: InputBorder.none)))),
          if (widget.labelText != "Contact")
            Container(
                height: height * 25,
                width: width * 30,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: IconButton(
                        icon: Image.asset('icons/edit.png'),
                        onPressed: () {
                          setState(() {
                            widget.editable = true;
                            FocusScope.of(context)
                                .requestFocus(widget.focusNode);
                          });
                        })))
        ]));
  }
}
