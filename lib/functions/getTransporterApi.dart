import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:flutter_config/flutter_config.dart';

Future<List<TransporterDetailsModal>> runGetTransporterApi(
    bool transporterApproved) async {
  var jsonData;
  List<TransporterDetailsModal> card = [];

  final String transporterApiUrl =
      FlutterConfig.get("transporterApiUrl").toString();
  http.Response response = await http.get(Uri.parse("$transporterApiUrl"));

  jsonData = json.decode(response.body);
  for (var json in jsonData) {
    TransporterDetailsModal transporterDetailsModel = TransporterDetailsModal();
    transporterDetailsModel.transporterId = json["transporterId"];
    transporterDetailsModel.phoneNo = json["phoneNo"];
    transporterDetailsModel.transporterName = json["transporterName"];
    transporterDetailsModel.companyName = json["companyName"];
    transporterDetailsModel.transporterLocation = json["transporterLocation"];
    transporterDetailsModel.kyc = json["kyc"];
    transporterDetailsModel.transporterApproved = json["transporterApproved"];
    transporterDetailsModel.companyApproved = json["companyApproved"];
    transporterDetailsModel.accountVerificationInProgress =
        json["accountVerificationInProgress"];
    card.add(transporterDetailsModel);
  }
  return card.reversed.toList();
}
