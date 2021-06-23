import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:flutter_config/flutter_config.dart';

Future<List<ShipperDetailsModal>> runGetTransporterApi(
    bool shipperApproved) async {
  var jsonData;
  List<ShipperDetailsModal> card = [];

  final String shipperApiUrl =
      FlutterConfig.get("transporterApiUrl").toString();
  http.Response response = await http.get(Uri.parse("$shipperApiUrl"));

  jsonData = json.decode(response.body);
  for (var json in jsonData) {
    ShipperDetailsModal transporterDetailsModel = ShipperDetailsModal();
    transporterDetailsModel.shipperId = json["shipperId"];
    transporterDetailsModel.phoneNo = json["phoneNo"];
    transporterDetailsModel.shipperName = json["shipperName"];
    transporterDetailsModel.companyName = json["companyName"];
    transporterDetailsModel.kyc = json["kyc"];
    transporterDetailsModel.shipperLocation = json["shipperLocation"];
    transporterDetailsModel.shipperApproved = json["shipperApproved"];
    transporterDetailsModel.companyApproved = json["companyApproved"];
    transporterDetailsModel.accountVerificationInProgress =
        json["accountVerificationInProgress"];
    card.add(transporterDetailsModel);
  }
  return card.reversed.toList();
}
