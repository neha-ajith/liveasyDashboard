import 'package:flutter/material.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/screens/updateShipperScreen.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/services/showDialog.dart';

class ShipperDataSource extends DataTableSource {
  final List<ShipperDetailsModel> _data;
  final BuildContext context;
  ShipperDataSource(
      {required List<ShipperDetailsModel> data, required this.context})
      : _data = data;
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  DataRow getRow(int index) {
    final _userdata = _data[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Icon(Icons.person_outlined)),
      DataCell(Text('${_userdata.shipperName}')),
      DataCell(Text('${_userdata.phoneNo}')),
      DataCell(Text('${_userdata.shipperLocation}')),
      DataCell(Text('${_userdata.companyName}')),
      if (_userdata.companyApproved!)
        DataCell(Text('Verified'))
      else if (_userdata.accountVerificationInProgress!)
        DataCell(Text('Pending'))
      else
        DataCell(Text('New/Rejected')),
      DataCell(Row(children: [
        IconButton(
            icon: Container(
                height: height * 19,
                width: width * 19,
                child: FittedBox(
                    fit: BoxFit.cover, child: Image.asset('icons/edit.png'))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UpdateShipperScreen(shipperDetails: _userdata)));
            }),
        SizedBox(width: width * 12),
        IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () async {
              dialogBox(
                  context,
                  "Alert",
                  "Are you sure to Delete this User ID.\n This action is non retriveable",
                  _userdata.shipperId!,
                  null);
            })
      ]))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
