import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> runDeleteUserApi(String type, String userId) async {
  String apiUrl;
  if (type == "Shipper") {
    apiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  } else {
    apiUrl = '${dotenv.env['transporterApiUrl'].toString()}';
  }

  final String additionalQuery = '/';
  http.Response response =
      await http.delete(Uri.parse("$apiUrl$additionalQuery$userId"));
  var jsonData = json.decode(response.body);
  print(jsonData["status"]);
}
