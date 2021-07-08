import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';

Future<List<ShipperDetailsModel>> runGetShipperApi(String choosenValue) async {
  final String shipperApiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  final String additionalQuery = '?companyApproved=';
  String compApproved;

  List<ShipperDetailsModel> card1 = [];
  List<ShipperDetailsModel> card2 = [];
  http.Response response;
  var jsonData;

  if (choosenValue == "All" || choosenValue == "Verified") {
    compApproved = "true";

    response = await http
        .get(Uri.parse("$shipperApiUrl$additionalQuery$compApproved"));

    jsonData = json.decode(response.body);
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
    card1.reversed.toList();
  }

  if (choosenValue == "All" || choosenValue == "Pending") {
    compApproved = "false";
    response = await http
        .get(Uri.parse("$shipperApiUrl$additionalQuery$compApproved"));
    jsonData = json.decode(response.body);
    for (var json in jsonData) {
      if (json['accountVerificationInProgress']) {
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
    }
    card2.reversed.toList();
  }
  return card1 + card2;
}
