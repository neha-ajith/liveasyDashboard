import 'package:flutter/material.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/screens/updateShipperScreen.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/deleteDialogBox.dart';

class DataSource extends DataTableSource {
  final List<ShipperDetailsModel> _data;
  final BuildContext context;
  DataSource({required List<ShipperDetailsModel> data, required this.context})
      : _data = data;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  double safeBlockVertical = SizeConfig.safeBlockVertical!;

  @override
  DataRow getRow(int index) {
    final _userdata = _data[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Icon(Icons.person_outlined)),
      DataCell(Text('${_userdata.shipperName}', textAlign: TextAlign.center)),
      DataCell(Text('${_userdata.phoneNo}', textAlign: TextAlign.center)),
      DataCell(
          Text('${_userdata.shipperLocation}', textAlign: TextAlign.center)),
      DataCell(Center(child: Text('${_userdata.companyName}'))),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateShipperScreen(shipperDetails: _userdata)));
              },
              icon: Icon(Icons.rate_review_outlined)),
          SizedBox(width: safeBlockHorizontal * 12),
          IconButton(
              onPressed: () async {
                deleteDialog(context, _userdata.shipperId!);
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
