import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

// ignore: must_be_immutable
class FilterButtonWidget extends StatefulWidget {
  final String type;
  FilterButtonWidget({Key? key, required this.type}) : super(key: key);

  @override
  _FilterButtonWidgetState createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  List<String> filterItem = ["All", "Verified", "Pending"];
  var shipperController;
  var transporterController;

  @override
  Widget build(BuildContext context) {
    if (widget.type.toString() == "Shipper") {
      shipperController = Get.find<ShipperController>();
    } else {
      transporterController = Get.find<TransporterController>();
    }
    return Container(
        height: safeBlockVertical * 32,
        width: safeBlockHorizontal * 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: borderWidth_1, color: greyColor)),
        child: DropdownButton(
            hint: Center(
                child: Text('Filter',
                    style: TextStyle(fontSize: 15, color: black))),
            style: TextStyle(fontSize: 15, color: black),
            dropdownColor: white,
            isExpanded: true,
            icon: Image.asset(
              'icons/filterIcon.png',
              alignment: Alignment.centerRight,
            ),
            underline: SizedBox(width: 20),
            value: widget.type == "Shipper"
                ? shipperController.choosenShipperFilter.value
                : transporterController.choosenTransporterFilter.value,
            onChanged: (newValue) {
              setState(() {
                if (widget.type == "Shipper") {
                  shipperController
                      .updateOnShipperFilterValue(newValue.toString());
                } else {
                  transporterController
                      .updateOnTransporterFilterValue(newValue.toString());
                }
              });
            },
            items: filterItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList()));
  }
}
