import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class TableStructure extends StatefulWidget {
  String type;
  var dts;
  TableStructure({required this.type, required this.dts});

  @override
  _TableStructureState createState() => _TableStructureState();
}

class _TableStructureState extends State<TableStructure> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  int _rowsPerPage = 8;
  int _rowsPerPage1 = 8;
  var defaultRowsPerPage = 8;

  @override
  Widget build(BuildContext context) {
    print(widget.type);
    var tableItemsCount = widget.dts.rowCount;
    var isRowCountLessDefault = tableItemsCount < defaultRowsPerPage;
    _rowsPerPage = isRowCountLessDefault ? tableItemsCount : defaultRowsPerPage;
    return PaginatedDataTable(
        dataRowHeight: height * space_16,
        availableRowsPerPage: [8, 15, 25],
        source: widget.dts,
        columnSpacing: 5,
        horizontalMargin: 20,
        rowsPerPage: isRowCountLessDefault ? _rowsPerPage : _rowsPerPage1,
        columns: [
          DataColumn(label: Text('')),
          DataColumn(
              label: Text('Name', style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Contact', style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label:
                  Text('Location', style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Company name',
                  style: TextStyle(fontWeight: boldWeight))),
          if (widget.type == "Shipper")
            DataColumn(
                label: Text('Status', style: TextStyle(fontWeight: boldWeight)))
          else
            DataColumn(
                label: Text('Transporter Status',
                    style: TextStyle(fontWeight: boldWeight))),
          if (widget.type == "Transporter")
            DataColumn(
                label: Text('Company Status',
                    style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Actions', style: TextStyle(fontWeight: boldWeight)))
        ],
        onRowsPerPageChanged: isRowCountLessDefault
            ? null
            : (rowCount) {
                setState(() {
                  _rowsPerPage1 = rowCount!;
                });
              });
  }
}
