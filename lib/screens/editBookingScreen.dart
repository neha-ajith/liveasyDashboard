// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/models/bookingsApiModel.dart';
import 'package:liveasy_admin/widgets/bookingDetail.dart';
import 'package:liveasy_admin/widgets/bookingDocRow.dart';
import 'package:liveasy_admin/widgets/cancelButtonWidget.dart';
import 'package:liveasy_admin/widgets/editTitleTextTemplete.dart';

class EditBookingDetails extends StatelessWidget {
  final List imageList;
  final BookingDetailsModel bookingDetails;
  EditBookingDetails(
      {Key? key, required this.bookingDetails, required this.imageList})
      : super(key: key);
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 37),
        Row(
          children: [
            SizedBox(width: width * 64),
            EditTitleTextTemplate(
                text: 'Booking details',
                height: height * 40,
                width: width * 240,
                fontSize: 32,
                fontWeight: mediumBoldWeight,
                color: greyColor),
          ],
        ),
        SizedBox(height: height * 30),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: backgroundColor,
            child: Container(
                width: width * 1200,
                padding: EdgeInsets.symmetric(
                    vertical: height * 46, horizontal: width * 64),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BookingDetail(
                              title: "Order: ",
                              detail: bookingDetails.bookingId!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Loading Point: ",
                              detail: bookingDetails.loadingPoint!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Unloading Point: ",
                              detail: bookingDetails.unloadingPoint!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Booking Date: ",
                              detail: bookingDetails.bookingDate!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Driver Name: ",
                              detail: bookingDetails.driverName!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Vehicle Number: ",
                              detail: bookingDetails.vehicleNumber!),
                          SizedBox(height: 20),
                          BookingDetail(
                              title: "Contact Number: ",
                              detail: bookingDetails.contactNumber!),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text("Booking Status: ",
                                  style:
                                      TextStyle(fontWeight: mediumBoldWeight)),
                              SizedBox(width: 5),
                              Text("Ongoing",
                                  style: TextStyle(color: forgotColor)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 50),
                      VerticalDivider(
                        color: tabSelection,
                        thickness: 1,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Uploaded Documents",
                              style: TextStyle(fontWeight: boldWeight)),
                          SizedBox(height: 20),
                          Text("Lorry Reciept"),
                          SizedBox(height: 10),
                          DocumentRow(imageList: [
                            imageList[0],
                            imageList[1],
                            imageList[2],
                            imageList[3]
                          ]),
                          SizedBox(height: 20),
                          Text("Eway Bill"),
                          SizedBox(height: 10),
                          DocumentRow(imageList: [
                            imageList[4],
                            imageList[5],
                            imageList[6],
                            imageList[7]
                          ]),
                          SizedBox(height: 20),
                          Text("Weight Reciepts"),
                          SizedBox(height: 10),
                          DocumentRow(imageList: [
                            imageList[8],
                            imageList[9],
                            imageList[10],
                            imageList[11]
                          ]),
                          SizedBox(height: 20),
                          Text("POD (Pahoch) Photo"),
                          SizedBox(height: 10),
                          DocumentRow(imageList: [null, null, null, null]),
                        ],
                      )
                    ],
                  ),
                ))),
        SizedBox(height: height * 10),
        CancelButtonWidget(),
        SizedBox(height: height * 10)
      ],
    );
  }
}
