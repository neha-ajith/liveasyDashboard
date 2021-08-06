import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'accessingurl.dart' as ac;

Future<List<ShipperDetailsModel>> runGetShipperApi(String choosenValue) async {

  //final String shipperApiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  List<String> li = await Future.wait<String>([
    ac.getshipperurl(),
  ]);
  final String shipperApiUrl = li[0];

  final String additionalQuery = '?companyApproved=';
  final String paginationQuery = '&pageNo=';
  List<ShipperDetailsModel> card1 = [];
  List<ShipperDetailsModel> card2 = [];
  List<ShipperDetailsModel> card3 = [];

  if (choosenValue == "All" || choosenValue == "Verified") {
    String compApproved = "true";
    for (int i = 0;; i++) {
      http.Response response = await http.get(Uri.parse(
          "$shipperApiUrl$additionalQuery$compApproved$paginationQuery$i"));
      var jsonData = json.decode(response.body);
      if (jsonData.isEmpty) {
        break;
      }
      for (var json in jsonData) {
        ShipperDetailsModel shipperDetailsModel = ShipperDetailsModel();
        shipperDetailsModel.shipperId = json["shipperId"];
        shipperDetailsModel.phoneNo = json["phoneNo"];
        shipperDetailsModel.shipperName = json["shipperName"];
        shipperDetailsModel.companyName = json["companyName"];
        shipperDetailsModel.shipperLocation = json["shipperLocation"];
        shipperDetailsModel.companyApproved = json["companyApproved"];
        shipperDetailsModel.accountVerificationInProgress =
        json["accountVerificationInProgress"];
        card1.add(shipperDetailsModel);
      }
    }
  }

  if (choosenValue == "All" ||
      choosenValue == "Pending" ||
      choosenValue == "New/Rejected") {
    String compApproved = "false";

    for (int i = 0;; i++) {
      http.Response response = await http.get(Uri.parse(
          "$shipperApiUrl$additionalQuery$compApproved$paginationQuery$i"));
      var jsonData = json.decode(response.body);

      if (jsonData.isEmpty) {
        break;
      }

      for (var json in jsonData) {
        if ((choosenValue == "All" || choosenValue == "Pending") &&
            json['accountVerificationInProgress'] == true) {
          ShipperDetailsModel shipperDetailsModel = ShipperDetailsModel();
          shipperDetailsModel.shipperId = json["shipperId"];
          shipperDetailsModel.phoneNo = json["phoneNo"];
          shipperDetailsModel.shipperName = json["shipperName"];
          shipperDetailsModel.companyName = json["companyName"];
          shipperDetailsModel.shipperLocation = json["shipperLocation"];
          shipperDetailsModel.companyApproved = json["companyApproved"];
          shipperDetailsModel.accountVerificationInProgress =
          json["accountVerificationInProgress"];
          card2.add(shipperDetailsModel);
        }
        if ((choosenValue == "All" || choosenValue == "New/Rejected") &&
            json['accountVerificationInProgress'] == false) {
          ShipperDetailsModel shipperDetailsModel = ShipperDetailsModel();
          shipperDetailsModel.shipperId = json["shipperId"];
          shipperDetailsModel.phoneNo = json["phoneNo"];
          shipperDetailsModel.shipperName = json["shipperName"];
          shipperDetailsModel.companyName = json["companyName"];
          shipperDetailsModel.shipperLocation = json["shipperLocation"];
          shipperDetailsModel.companyApproved = json["companyApproved"];
          shipperDetailsModel.accountVerificationInProgress =
          json["accountVerificationInProgress"];
          card3.add(shipperDetailsModel);
        }
      }
    }
  }
  return card1 + card2 + card3;
}
