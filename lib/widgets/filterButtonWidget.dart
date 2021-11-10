import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';

// ignore: must_be_immutable
class FilterButtonWidget extends StatefulWidget {
  final String type;
  FilterButtonWidget({required this.type});

  @override
  _FilterButtonWidgetState createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  List<String> filterItem = ["All", "Verified", "Pending", "New/Rejected"];
  var shipperController;
  var transporterController;
  String? choosenValue;

  @override
  Widget build(BuildContext context) {
    if (widget.type.toString() == "Shipper") {
      shipperController = Get.find<ShipperController>();
    } else {
      transporterController = Get.find<TransporterController>();
    }
    return Container(
        height: height * 40,
        width: width * 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: borderWidth_0pt85, color: signInColor)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              hint: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    height: height * 30,
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text('Filter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontFamily: 'montserrat'))))
              ]),
              icon: Container(
                  padding: EdgeInsets.only(right: width * 20),
                  height: height * 28,
                  width: width * 30,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child:
                          Image.asset('icons/filterIcon.png', color: black))),
              dropdownColor: white,
              isExpanded: true,
              value: choosenValue,
              onChanged: (newValue) {
                setState(() {
                  choosenValue = newValue.toString();
                  if (widget.type == "Shipper") {
                    shipperController
                        .updateOnShipperFilterValue(newValue.toString());
                  } else {
                    transporterController
                        .updateOnTransporterFilterValue(newValue.toString());
                  }
                });
              },
              menuMaxHeight: height * 250,
              items: filterItem.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem,
                    child: Container(
                        padding: EdgeInsets.only(left: width * 15),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(valueItem,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 15, color: black)))));
              }).toList()),
        ));
  }
}
