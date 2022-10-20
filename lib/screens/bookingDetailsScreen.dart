import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/getBookingApi.dart';
import 'package:liveasy_admin/services/bookingDataSource.dart';
import 'package:liveasy_admin/widgets/bookingTableStructure.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/services/showDialog.dart';

class BookingDetailsScreen extends StatefulWidget {
  @override
  _BookingDetailsScreenState createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen>
    with AutomaticKeepAliveClientMixin<BookingDetailsScreen> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  String query = '';
  // BookingController BookingController =
  //     Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 37),
              Container(
                  height: height * 40,
                  width: width * 240,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text('Booking details',
                          style: TextStyle(fontSize: 32)))),
              SizedBox(height: height * 30),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(gapPadding: 1),
                    hintText: 'Search any booking',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  }),
              SizedBox(height: height * 30),
              Container(
                  width: width * 1137,
                  child:
                      // Obx(() {
                      // BookingController.BookingDeleted.value;
                      // BookingController.BookingAPIfailed.value;
                      // return
                      FutureBuilder(
                          future: runGetBookingApi(query),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                if (snapshot.data.length == 0) {
                                  return Center(child: Text('NO Data'));
                                } else {
                                  var dts = BookingDataSource(
                                      data: snapshot.data, context: context);
                                  return BookingTableStructure(dts: dts);
                                }
                              } else {
                                Future(() {
                                  dialogBox(
                                      context,
                                      'Error Loading Booking Details',
                                      'Unable to Fetch Booking Details\nPlease try again later',
                                      null,
                                      "Booking");
                                });
                                return Container();
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }))
            ]));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
