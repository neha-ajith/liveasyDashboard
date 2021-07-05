import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ListData.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/screens/updateShipperScreen.dart';
import 'package:liveasy_admin/functions/delShipperApi.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

class DataSource extends DataTableSource {
  final List<ShipperDetailsModal> _data;
  DataSource({required List<ShipperDetailsModal> data}) : _data = data;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  ListDataController listDataController = Get.put(ListDataController());

  @override
  DataRow getRow(int index) {
    final _userdata = _data[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Icon(Icons.person_outlined)),
      DataCell(Text('${_userdata.shipperName}', textAlign: TextAlign.center)),
      DataCell(Text('${_userdata.phoneNo}', textAlign: TextAlign.center)),
      DataCell(
          Text('${_userdata.shipperLocation}', textAlign: TextAlign.center)),
      // DataCell(Column(children: [
      //   Text('ID Proof'),
      //   Image.asset('icons/Pan_card.png',
      //       width: safeBlockVertical * width_35,
      //       height: safeBlockVertical * height_30),
      //   Text('Address Proof'),
      //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     SizedBox(height: safeBlockVertical * height_20),
      //     Image.asset('icons/Aadhar_card(front).png',
      //         width: safeBlockVertical * width_35,
      //         height: safeBlockVertical * height_30),
      //     SizedBox(width: safeBlockHorizontal * width_10),
      //     Image.asset('icons/Aadhar_card(back).png',
      //         width: safeBlockVertical * width_35,
      //         height: safeBlockVertical * height_30),
      //   ])
      // ])),
      DataCell(Center(child: Text('${_userdata.companyName}'))),
      // DataCell(Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text('Company ID\nProof'),
      //       Image.asset('icons/companyProof.png',
      //           width: safeBlockVertical * width_35,
      //           height: safeBlockVertical * height_30)
      //     ])),
      if (_userdata.companyApproved!)
        DataCell(Text('Verified', textAlign: TextAlign.center))
      else if (_userdata.accountVerificationInProgress!)
        DataCell(Text('Pending', textAlign: TextAlign.center))
      else
        DataCell(Text('Cancelled', textAlign: TextAlign.center)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                Get.to((() => UpdateShipperScreen(shipperDetails: _userdata)));
              },
              icon: Icon(Icons.rate_review_outlined)),
          SizedBox(width: safeBlockHorizontal * 12),
          IconButton(
              onPressed: () async {
                await runDeleteShipperApi(_userdata.shipperId!);
                listDataController.updateOnShipperDelete(true);
              },
              icon: Icon(Icons.delete_outlined))
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
