import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/bookingsApiModel.dart';
import 'package:liveasy_admin/functions/accessingurl.dart' as ac;

Future<List<BookingDetailsModel>> runGetBookingApi(String query) async {
  List<String> li = await Future.wait<String>([
    ac.getBookingUrl(),
  ]);
  final String bookingApiUrl = li[0];

  final String additionalQuery = "?cancel=false&completed=false";
  final String paginationQuery = "&pageNo=";

  List<BookingDetailsModel> card = [];

  for (int i = 0;; i++) {
    http.Response response = await http
        .get(Uri.parse('$bookingApiUrl$additionalQuery$paginationQuery$i'));
    var jsonData = json.decode(response.body);
    if (jsonData.isEmpty) {
      break;
    }

    for (var json in jsonData) {
      BookingDetailsModel bookingDetailsModel = BookingDetailsModel();
      bookingDetailsModel.bookingId =
          json["bookingId"] != null ? json["bookingId"] : "NA";
      bookingDetailsModel.loadingPoint =
          json["loadingPointCity"] != null ? json["loadingPointCity"] : "NA";
      bookingDetailsModel.unloadingPoint = json["unloadingPointCity"] != null
          ? json["unloadingPointCity"]
          : "NA";
      bookingDetailsModel.bookingDate =
          json["bookingDate"] != null ? json["bookingDate"] : "15-10-2022";
      bookingDetailsModel.vehicleNumber =
          json["truckId"][0] != null ? json["truckId"][0] : "NA";
      bookingDetailsModel.contactNumber =
          json["driverPhoneNum"] != null ? json["driverPhoneNum"] : "NA";
      bookingDetailsModel.driverName =
          json["driverName"] != null ? json["driverName"] : "NA";
      card.add(bookingDetailsModel);
    }
  }
  card = card
      .where((element) =>
          element.bookingId!.toLowerCase().contains(query.toLowerCase()) ||
          element.loadingPoint!.toLowerCase().contains(query.toLowerCase()) ||
          element.unloadingPoint!.toLowerCase().contains(query.toLowerCase()) ||
          element.bookingDate!.toLowerCase().contains(query.toLowerCase()) ||
          element.vehicleNumber!.toLowerCase().contains(query.toLowerCase()) ||
          element.contactNumber!.toLowerCase().contains(query.toLowerCase()) ||
          element.driverName!.toLowerCase().contains(query.toLowerCase()))
      .toList();
  return card;
}
