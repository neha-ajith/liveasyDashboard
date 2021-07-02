import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/shipperApiModel.dart';

Future<List<ShipperDetailsModal>> runPutShipperApi(String shipperId) async {
  final String shipperApiUrl = 'http://3.108.47.10:8080/shipper';
  final String additionalQuery = '/';

  var jsonData;
  List<ShipperDetailsModal> card1 = [];

  http.Response response =
      await http.put(Uri.parse("$shipperApiUrl$additionalQuery$shipperId"));

  jsonData = json.decode(response.body);
  ShipperDetailsModal shipperDetailsModel = ShipperDetailsModal();
  shipperDetailsModel.shipperId = jsonData["shipperId"];
  shipperDetailsModel.phoneNo = jsonData["phoneNo"];
  shipperDetailsModel.shipperName = jsonData["shipperName"];
  shipperDetailsModel.companyName = jsonData["companyName"];
  shipperDetailsModel.shipperLocation = jsonData["shipperLocation"];
  shipperDetailsModel.companyApproved = jsonData["companyApproved"];
  shipperDetailsModel.accountVerificationInProgress =
      jsonData["accountVerificationInProgress"];
  card1.add(shipperDetailsModel);

  return (card1);
}
