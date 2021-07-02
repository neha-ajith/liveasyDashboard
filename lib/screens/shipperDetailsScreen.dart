import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/getShipperApi.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSize.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/screens/updateShipperScreen.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/widgets/deleteAlert.dart';

class DataSource extends DataTableSource {
  final List<ShipperDetailsModal> _data;
  BuildContext? context;
  Function? onConfirmed;
  DataSource(
      {required List<ShipperDetailsModal> data,
      required context,
      required onConfirmed})
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
      DataCell(Column(children: [
        Text('ID Proof'),
        Image.asset('icons/Pan_card.png',
            width: safeBlockVertical * width_35,
            height: safeBlockVertical * height_30),
        Text('Address Proof'),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: safeBlockVertical * height_20),
          Image.asset('icons/Aadhar_card(front).png',
              width: safeBlockVertical * width_35,
              height: safeBlockVertical * height_30),
          SizedBox(width: safeBlockHorizontal * width_10),
          Image.asset('icons/Aadhar_card(back).png',
              width: safeBlockVertical * width_35,
              height: safeBlockVertical * height_30),
        ])
      ])),
      DataCell(Center(child: Text('${_userdata.companyName}'))),
      DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Company ID\nProof'),
            Image.asset('icons/companyProof.png',
                width: safeBlockVertical * width_35,
                height: safeBlockVertical * height_30)
          ])),
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
          SizedBox(width: safeBlockHorizontal * width_10),
          IconButton(
              onPressed: () async {
                await showMyDialog(context!, _userdata.shipperId!);
                onConfirmed!();
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

class ShipperDetailsScreen extends StatefulWidget {
  const ShipperDetailsScreen({Key? key}) : super(key: key);

  @override
  _ShipperDetailsScreenState createState() => _ShipperDetailsScreenState();
}

class _ShipperDetailsScreenState extends State<ShipperDetailsScreen> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  List<String> filterItem = ["All", "Verified", "Pending"];
  String? choosenValue;

  onDeleted() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: safeBlockVertical * height_49),
          Row(children: [
            Text('Shipper details', style: TextStyle(fontSize: size_32)),
            SizedBox(width: safeBlockHorizontal * width_727),
            Container(
                height: safeBlockVertical * height_31,
                width: safeBlockHorizontal * width_86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                    value: choosenValue,
                    onChanged: (newValue) {
                      setState(() {
                        choosenValue = newValue.toString();
                      });
                    },
                    items: filterItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList()))
          ]),
          SizedBox(height: safeBlockVertical * height_30),
          Column(children: [
            Container(
                height: safeBlockVertical * height_842,
                width: safeBlockHorizontal * width_1137,
                padding:
                    EdgeInsets.only(top: safeBlockVertical * paddingHeight),
                child: FutureBuilder(
                    future: choosenValue == null
                        ? runGetShipperApi("All")
                        : runGetShipperApi(choosenValue),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Center(child: Text('Loading'));
                      } else if (snapshot.data.length == 0) {
                        return Center(child: Text('NO Data'));
                      } else {
                        List<ShipperDetailsModal> data = snapshot.data;
                        var dts = DataSource(
                            data: data,
                            context: context,
                            onConfirmed: onDeleted);
                        int _rowsPerPage = 5;
                        int _rowsPerPage1 = 5;
                        var tableItemsCount = dts.rowCount;
                        var defaultRowsPerPage = 5;
                        var isRowCountLessDefault =
                            tableItemsCount < defaultRowsPerPage;
                        _rowsPerPage = isRowCountLessDefault
                            ? tableItemsCount
                            : defaultRowsPerPage;
                        return PaginatedDataTable(
                          columnSpacing: safeBlockHorizontal * width_33,
                          dataRowHeight: safeBlockVertical * height_130,
                          availableRowsPerPage: [5, 10, 15, 20, 25],
                          source: dts,
                          rowsPerPage: isRowCountLessDefault
                              ? _rowsPerPage
                              : _rowsPerPage1,
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(
                                label: Text('Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Contact',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Address',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Document Image',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Company name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Company details',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Status',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Actions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                          ],
                          onRowsPerPageChanged: isRowCountLessDefault
                              ? null
                              : (rowCount) {
                                  setState(() {
                                    _rowsPerPage1 = rowCount!;
                                  });
                                },
                        );
                      }
                    }))
          ])
        ]);
  }
}
