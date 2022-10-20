import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/models/bookingsApiModel.dart';
import 'package:liveasy_admin/screens/updateBookingScreen.dart';

class BookingDataSource extends DataTableSource {
  final List<BookingDetailsModel> _data;
  final BuildContext context;
  BookingDataSource(
      {required List<BookingDetailsModel> data, required this.context})
      : _data = data;
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  DataRow getRow(int index) {
    final _bookingdata = _data[index];
    DateTime date =
        new DateFormat("dd-mm-yyyy").parse(_bookingdata.bookingDate!);
    String finalDate = DateFormat("dd MMM, yyyy").format(date);
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${_bookingdata.bookingId}')),
      DataCell(Text('${_bookingdata.loadingPoint}')),
      DataCell(Text('${_bookingdata.unloadingPoint}')),
      DataCell(Text('$finalDate')),
      DataCell(Text('${_bookingdata.vehicleNumber}')),
      DataCell(Text('${_bookingdata.driverName}')),
      DataCell(Text('${_bookingdata.contactNumber}')),
      DataCell(Container(
          decoration: BoxDecoration(
              color: signInColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextButton(
              child: Text("View More", style: TextStyle(color: white)),
              onPressed: () {
                Get.to(UpdateBookingScreen(bookingDetails: _bookingdata));
              })))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
