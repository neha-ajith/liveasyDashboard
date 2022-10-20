import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

class BookingTableStructure extends StatefulWidget {
  var dts;
  BookingTableStructure({required this.dts});

  @override
  _BookingTableStructureState createState() => _BookingTableStructureState();
}

class _BookingTableStructureState extends State<BookingTableStructure> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  int _rowsPerPage = 8;
  int _rowsPerPage1 = 8;
  var defaultRowsPerPage = 8;

  @override
  Widget build(BuildContext context) {
    // print(widget.type);
    var bookingTableItemsCount = widget.dts.rowCount;
    var isRowCountLessDefault = bookingTableItemsCount < defaultRowsPerPage;
    _rowsPerPage =
        isRowCountLessDefault ? bookingTableItemsCount : defaultRowsPerPage;
    return PaginatedDataTable(
        dataRowHeight: height * space_16,
        availableRowsPerPage: [8, 15, 25],
        source: widget.dts,
        columnSpacing: 5,
        horizontalMargin: 20,
        rowsPerPage: isRowCountLessDefault ? _rowsPerPage : _rowsPerPage1,
        columns: [
          DataColumn(
              label:
                  Text('Booking ID', style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Loading Point',
                  style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Unloading Point',
                  style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Booking Date',
                  style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Vehicle Number',
                  style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Driver Name',
                  style: TextStyle(fontWeight: boldWeight))),
          DataColumn(
              label: Text('Contact', style: TextStyle(fontWeight: boldWeight))),
          DataColumn(label: Text('', style: TextStyle(fontWeight: boldWeight)))
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
