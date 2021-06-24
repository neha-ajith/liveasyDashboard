import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:flutter_config/flutter_config.dart';

Future<List<ShipperDetailsModal>> runGetShipperApi(bool companyApproved) async {
  String additionalQuery = '?companyApproved=companyApproved';
  var jsonData;
  List<ShipperDetailsModal> card = [];

  final String shipperApiUrl = FlutterConfig.get("shipperApiUrl").toString();
  http.Response response =
      await http.get(Uri.parse("$shipperApiUrl$additionalQuery"));

  jsonData = json.decode(response.body);
  for (var json in jsonData) {
    ShipperDetailsModal transporterDetailsModel = ShipperDetailsModal();
    transporterDetailsModel.shipperId = json["shipperId"];
    transporterDetailsModel.phoneNo = json["phoneNo"];
    transporterDetailsModel.shipperName = json["shipperName"];
    transporterDetailsModel.companyName = json["companyName"];
    transporterDetailsModel.shipperLocation = json["shipperLocation"];
    transporterDetailsModel.shipperApproved = json["shipperApproved"];
    transporterDetailsModel.companyApproved = json["companyApproved"];
    transporterDetailsModel.accountVerificationInProgress =
        json["accountVerificationInProgress"];
    card.add(transporterDetailsModel);
  }
  return card.reversed.toList();
}
