import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> runDeleteShipperApi(String shipperId) async {
  final String shipperApiUrl = 'http://3.108.47.10:8080/shipper';
  final String additionalQuery = '/';

  var jsonData;
  http.Response response =
      await http.delete(Uri.parse("$shipperApiUrl$additionalQuery$shipperId"));
  jsonData = json.decode(response.body);
  if (jsonData["status"] == "Success") {
    return "Account Deleted";
  } else {
    return "Error";
  }
}
