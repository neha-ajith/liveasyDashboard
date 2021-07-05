import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/screens/updateTransporterScreen.dart';
//import 'package:liveasy_admin/functions/delTransporterApi.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

class DataSource extends DataTableSource {
  final List<TransporterDetailsModal> _data;
  DataSource({required List<TransporterDetailsModal> data}) : _data = data;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  TransporterController transporterController =
      Get.put(TransporterController());

  @override
  DataRow getRow(int index) {
    final _userdata = _data[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Icon(Icons.person_outlined)),
      DataCell(
          Text('${_userdata.transporterName}', textAlign: TextAlign.center)),
      DataCell(Text('${_userdata.phoneNo}', textAlign: TextAlign.center)),
      DataCell(Text('${_userdata.transporterLocation}',
          textAlign: TextAlign.center)),
      // DataCell(Column(children: [
      //   Text('ID Proof'),
      //   Image.asset('icons/Pan_card.png',
      //       width: safeBlockVertical * 35, height: safeBlockVertical * 30),
      //   Text('Address Proof'),
      //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     SizedBox(height: safeBlockVertical * 20),
      //     Image.asset('icons/Aadhar_card(front).png',
      //         width: safeBlockVertical * 35, height: safeBlockVertical * 30),
      //     SizedBox(width: safeBlockHorizontal * 10),
      //     Image.asset('icons/Aadhar_card(back).png',
      //         width: safeBlockVertical * 35, height: safeBlockVertical * 30),
      //   ])
      // ])),
      DataCell(Center(child: Text('${_userdata.companyName}'))),
      // DataCell(Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text('Company ID\nProof'),
      //       Image.asset('icons/companyProof.png',
      //           width: safeBlockVertical * 35, height: safeBlockVertical * 30)
      //     ])),
      if (_userdata.transporterApproved!)
        DataCell(Text('Verified', textAlign: TextAlign.center))
      else if (_userdata.accountVerificationInProgress!)
        DataCell(Text('Pending', textAlign: TextAlign.center))
      else
        DataCell(Text('Cancelled', textAlign: TextAlign.center)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                Get.to((() =>
                    UpdateTransporterScreen(transporterDetails: _userdata)));
              },
              icon: Icon(Icons.rate_review_outlined)),
          SizedBox(width: safeBlockHorizontal * 12),
          IconButton(
              onPressed: () async {
//                await runDeleteTransporterApi(_userdata.transporterId!);
                transporterController.updateOnTransporterDelete(true);
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
