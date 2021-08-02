import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';

Future<ShipperDetailsModel> runGetShipperPhoneNoApi(String PhoneNo) async {
  final String shipperApiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  final String searchedPhoneNoQuery = '?phoneNo=$PhoneNo';
  var shipperPhoneNo =
      await http.get(Uri.parse("$shipperApiUrl$searchedPhoneNoQuery"));
  var jsonData = json.decode(shipperPhoneNo.body);
  jsonData = jsonData[0];
  ShipperDetailsModel shipperDetailsModel = ShipperDetailsModel();
  shipperDetailsModel.shipperId = jsonData["shipperId"].toString();
  shipperDetailsModel.phoneNo = jsonData["phoneNo"].toString();
  shipperDetailsModel.shipperName = jsonData["shipperName"].toString();
  shipperDetailsModel.companyName = jsonData["companyName"].toString();
  shipperDetailsModel.shipperLocation = jsonData["shipperLocation"].toString();
  shipperDetailsModel.companyApproved = jsonData["companyApproved"];
  shipperDetailsModel.accountVerificationInProgress =
      jsonData["accountVerificationInProgress"];
  return shipperDetailsModel;
}

Future<TransporterDetailsModel> runGetTransporterPhoneNoApi(
    String PhoneNo) async {
  final String transporterApiUrl =
      '${dotenv.env['transporterApiUrl'].toString()}';
  final String searchedPhoneNoQuery = '?phoneNo=$PhoneNo';
  var transporterPhoneNo =
      await http.get(Uri.parse("$transporterApiUrl$searchedPhoneNoQuery"));
  var jsonData = json.decode(transporterPhoneNo.body);
  jsonData = jsonData[0];
  TransporterDetailsModel transporterDetailsModel = TransporterDetailsModel();
  transporterDetailsModel.transporterId = jsonData["transporterId"].toString();
  transporterDetailsModel.phoneNo = jsonData["phoneNo"].toString();
  transporterDetailsModel.transporterName =
      jsonData["transporterName"].toString();
  transporterDetailsModel.companyName = jsonData["companyName"].toString();
  transporterDetailsModel.transporterLocation =
      jsonData["transporterLocation"].toString();
  transporterDetailsModel.transporterApproved = jsonData["transporterApproved"];
  transporterDetailsModel.companyApproved = jsonData["companyApproved"];
  transporterDetailsModel.accountVerificationInProgress =
      jsonData["accountVerificationInProgress"];

  return transporterDetailsModel;
}
