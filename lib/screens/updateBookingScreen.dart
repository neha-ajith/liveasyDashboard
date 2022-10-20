import 'package:flutter/material.dart';
import 'package:liveasy_admin/models/bookingsApiModel.dart';
import 'package:liveasy_admin/screens/editBookingScreen.dart';
import 'package:liveasy_admin/services/getBookingDocuments.dart';
import 'package:liveasy_admin/widgets/appBar.dart';

class UpdateBookingScreen extends StatefulWidget {
  final BookingDetailsModel bookingDetails;
  UpdateBookingScreen({required this.bookingDetails});

  @override
  _UpdateBookingScreenState createState() => _UpdateBookingScreenState();
}

class _UpdateBookingScreenState extends State<UpdateBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
            child: Center(
                child: FutureBuilder(
                    future:
                        getBookingDocumentURL(widget.bookingDetails.bookingId!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          List list = [
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null,
                            null
                          ];
                          return EditBookingDetails(
                              imageList: list,
                              bookingDetails: widget.bookingDetails);
                        } else {
                          return EditBookingDetails(
                              imageList: snapshot.data,
                              bookingDetails: widget.bookingDetails);
                        }
                      }
                    }))));
  }
}
