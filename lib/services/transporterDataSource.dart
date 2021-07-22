import 'package:flutter/material.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/screens/updateTransporterScreen.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/services/showDialog.dart';

class TransporterDataSource extends DataTableSource {
  final List<TransporterDetailsModel> _data;
  final BuildContext context;
  TransporterDataSource(
      {required List<TransporterDetailsModel> data, required this.context})
      : _data = data;
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  DataRow getRow(int index) {
    final _userdata = _data[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Icon(Icons.person_outlined)),
      DataCell(Text('${_userdata.transporterName}')),
      DataCell(Text('${_userdata.phoneNo}')),
      DataCell(Text('${_userdata.transporterLocation}')),
      DataCell(Text('${_userdata.companyName}')),
      if (_userdata.transporterApproved!)
        DataCell(Text('Verified'))
      else if (_userdata.accountVerificationInProgress!)
        DataCell(Text('Pending'))
      else
        DataCell(Text('New/Rejected')),
      if (_userdata.companyApproved!)
        DataCell(Text('Verified'))
      else if (_userdata.companyApproved!)
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
                      UpdateTransporterScreen(transporterDetails: _userdata)));
            }),
        SizedBox(width: width * 12),
        IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () async {
              dialogBox(
                  context,
                  'Alert',
                  'Are you sure you want to Delete this User ID.\n This action is non retriveable',
                  _userdata.transporterId!,
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
