import 'dart:async';
import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/functions/accessingurl.dart' as ac;

Future<ShipperDetailsModel?> runGetShipperPhoneNoApi(String PhoneNo) async {
  List<String> li = await Future.wait<String>([
    ac.getshipperurl(),
  ]);

  final String shipperApiUrl = li[0];
  final String searchedPhoneNoQuery = '?phoneNo=$PhoneNo';
  try {
    var shipperPhoneNo =
        await http.get(Uri.parse("$shipperApiUrl$searchedPhoneNoQuery"));

    if (shipperPhoneNo.statusCode == 200) {
      var jsonData = json.decode(shipperPhoneNo.body);
      jsonData = jsonData[0];
      ShipperDetailsModel shipperDetailsModel = ShipperDetailsModel();
      shipperDetailsModel.shipperId = jsonData["shipperId"].toString();
      shipperDetailsModel.phoneNo = jsonData["phoneNo"].toString();
      shipperDetailsModel.shipperName = jsonData["shipperName"].toString();
      shipperDetailsModel.companyName = jsonData["companyName"].toString();
      shipperDetailsModel.shipperLocation =
          jsonData["shipperLocation"].toString();
      shipperDetailsModel.companyApproved = jsonData["companyApproved"];
      shipperDetailsModel.accountVerificationInProgress =
          jsonData["accountVerificationInProgress"];
      return shipperDetailsModel;
    } else {
      return null;
    }
  } catch (e) {
    final String shipperError = e.toString();
    print("Shipper Error $shipperError");
  }
}

Future<TransporterDetailsModel?> runGetTransporterPhoneNoApi(
    String PhoneNo) async {
  List<String> li = await Future.wait<String>([
    ac.gettransporterurl(),
  ]);
  final String transporterApiUrl = li[0];
  final String searchedPhoneNoQuery = '?phoneNo=$PhoneNo';
  try {
    var transporterPhoneNo =
        await http.get(Uri.parse("$transporterApiUrl$searchedPhoneNoQuery"));
    if (transporterPhoneNo.statusCode == 200) {
      var jsonData = json.decode(transporterPhoneNo.body);
      jsonData = jsonData[0];
      TransporterDetailsModel transporterDetailsModel =
          TransporterDetailsModel();
      transporterDetailsModel.transporterId =
          jsonData["transporterId"].toString();
      transporterDetailsModel.phoneNo = jsonData["phoneNo"].toString();
      transporterDetailsModel.transporterName =
          jsonData["transporterName"].toString();
      transporterDetailsModel.companyName = jsonData["companyName"].toString();
      transporterDetailsModel.transporterLocation =
          jsonData["transporterLocation"].toString();
      transporterDetailsModel.transporterApproved =
          jsonData["transporterApproved"];
      transporterDetailsModel.companyApproved = jsonData["companyApproved"];
      transporterDetailsModel.accountVerificationInProgress =
          jsonData["accountVerificationInProgress"];
      return transporterDetailsModel;
    } else {
      return null;
    }
  } catch (e) {
    final String transporterError = e.toString();
    print("Transporter Error $transporterError");
  }
}
