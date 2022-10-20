import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/functions/accessingurl.dart' as ac;

Future<List<TransporterDetailsModel>> runGetTransporterApi(
    String choosenValue) async {
  List<String> li = await Future.wait<String>([
    ac.gettransporterurl(),
  ]);
  print(li);
  final String transporterApiUrl = li[0];

  final String additionalQuery = '?transporterApproved=';
  final String paginationQuery = '&pageNo=';

  List<TransporterDetailsModel> card1 = [];
  List<TransporterDetailsModel> card2 = [];
  List<TransporterDetailsModel> card3 = [];

  if (choosenValue == "All" || choosenValue == "Verified") {
    String transApproved = "true";

    for (int i = 0;; i++) {
      http.Response response = await http.get(Uri.parse(
          '$transporterApiUrl$additionalQuery$transApproved$paginationQuery$i'));
      var jsonData = json.decode(response.body);
      if (jsonData.isEmpty) {
        break;
      }

      for (var json in jsonData) {
        TransporterDetailsModel transporterDetailsModel =
            TransporterDetailsModel();
        transporterDetailsModel.transporterId = json["transporterId"];
        transporterDetailsModel.phoneNo = json["phoneNo"];
        transporterDetailsModel.transporterName = json["transporterName"];
        transporterDetailsModel.companyName = json["companyName"];
        transporterDetailsModel.transporterLocation =
            json["transporterLocation"];
        transporterDetailsModel.transporterApproved =
            json["transporterApproved"];
        transporterDetailsModel.companyApproved = json["companyApproved"];
        transporterDetailsModel.accountVerificationInProgress =
            json["accountVerificationInProgress"];
        card1.add(transporterDetailsModel);
      }
    }
  }

  if (choosenValue == "All" ||
      choosenValue == "Pending" ||
      choosenValue == "New/Rejected") {
    String transApproved = "false";

    for (int i = 0;; i++) {
      http.Response response = await http.get(Uri.parse(
          "$transporterApiUrl$additionalQuery$transApproved$paginationQuery$i"));
      var jsonData = json.decode(response.body);
      if (jsonData.isEmpty) {
        break;
      }
      for (var json in jsonData) {
        if ((choosenValue == "All" || choosenValue == "Pending") &&
            json['accountVerificationInProgress']) {
          TransporterDetailsModel transporterDetailsModel =
              TransporterDetailsModel();
          transporterDetailsModel.transporterId = json["transporterId"];
          transporterDetailsModel.phoneNo = json["phoneNo"];
          transporterDetailsModel.transporterName = json["transporterName"];
          transporterDetailsModel.companyName = json["companyName"];
          transporterDetailsModel.transporterLocation =
              json["transporterLocation"];
          transporterDetailsModel.transporterApproved =
              json["transporterApproved"];
          transporterDetailsModel.companyApproved = json["companyApproved"];
          transporterDetailsModel.accountVerificationInProgress =
              json["accountVerificationInProgress"];
          card2.add(transporterDetailsModel);
        }
        if ((choosenValue == "All" || choosenValue == "New/Rejected") &&
            json['accountVerificationInProgress'] == false) {
          TransporterDetailsModel transporterDetailsModel =
              TransporterDetailsModel();
          transporterDetailsModel.transporterId = json["transporterId"];
          transporterDetailsModel.phoneNo = json["phoneNo"];
          transporterDetailsModel.transporterName = json["transporterName"];
          transporterDetailsModel.companyName = json["companyName"];
          transporterDetailsModel.transporterLocation =
              json["transporterLocation"];
          transporterDetailsModel.transporterApproved =
              json["transporterApproved"];
          transporterDetailsModel.companyApproved = json["companyApproved"];
          transporterDetailsModel.accountVerificationInProgress =
              json["accountVerificationInProgress"];
          card3.add(transporterDetailsModel);
        }
      }
    }
  }
  return card1 + card2 + card3;
}
