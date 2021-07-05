import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ListData.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

// ignore: must_be_immutable
class FilterButtonWidger extends StatelessWidget {
  String? type;
  FilterButtonWidger({Key? key, required type}) : super(key: key);

  ListDataController listDataController = Get.put(ListDataController());
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  List<String> filterItem = ["All", "Verified", "Pending"];

  @override
  Widget build(BuildContext context) {
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
            value: type == "Shipper"
                ? listDataController.choosenShipperFilter.value
                : listDataController.choosenTransporterFilter.value,
            onChanged: (newValue) {
              type == "Shipper"
                  ? listDataController
                      .updateOnShipperFilterValue(newValue.toString())
                  : listDataController
                      .updateOnTransporterFilterValue(newValue.toString());
            },
            items: filterItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList()));
  }
}
