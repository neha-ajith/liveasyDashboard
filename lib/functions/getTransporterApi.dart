import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';

Future<List<TransporterDetailsModal>> runGetTransporterApi(
    String choosenValue) async {
  final String transporterApiUrl =
      '${dotenv.env['transporterApiUrl'].toString()}';
  final String additionalQuery = '?transporterApproved=';
  String transApproved;

  List<TransporterDetailsModal> card1 = [];
  List<TransporterDetailsModal> card2 = [];
  http.Response response;
  var jsonData;

  if (choosenValue == "All" || choosenValue == "Verified") {
    transApproved = "true";

    response = await http
        .get(Uri.parse('$transporterApiUrl$additionalQuery$transApproved'));

    jsonData = json.decode(response.body);
    for (var json in jsonData) {
      TransporterDetailsModal transporterDetailsModel =
          TransporterDetailsModal();
      transporterDetailsModel.transporterId = json["transporterId"];
      transporterDetailsModel.phoneNo = json["phoneNo"];
      transporterDetailsModel.transporterName = json["transporterName"];
      transporterDetailsModel.companyName = json["companyName"];
      transporterDetailsModel.transporterLocation = json["transporterLocation"];
      transporterDetailsModel.transporterApproved = json["transporterApproved"];
      transporterDetailsModel.accountVerificationInProgress =
          json["accountVerificationInProgress"];
      card1.add(transporterDetailsModel);
    }
    card1.reversed.toList();
  }

  if (choosenValue == "All" || choosenValue == "Pending") {
    transApproved = "false";
    response = await http
        .get(Uri.parse("$transporterApiUrl$additionalQuery$transApproved"));
    jsonData = json.decode(response.body);
    for (var json in jsonData) {
      if (json['accountVerificationInProgress']) {
        TransporterDetailsModal transporterDetailsModel =
            TransporterDetailsModal();
        transporterDetailsModel.transporterId = json["transporterId"];
        transporterDetailsModel.phoneNo = json["phoneNo"];
        transporterDetailsModel.transporterName = json["transporterName"];
        transporterDetailsModel.companyName = json["companyName"];
        transporterDetailsModel.transporterLocation =
            json["transporterLocation"];
        transporterDetailsModel.transporterApproved =
            json["transporterApproved"];
        transporterDetailsModel.accountVerificationInProgress =
            json["accountVerificationInProgress"];
        card2.add(transporterDetailsModel);
      }
    }
    card2.reversed.toList();
  }
  return card1 + card2;
}
