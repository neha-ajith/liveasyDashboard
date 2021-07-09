import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future runPutShipperApi(
    {required Map toBeUpdated, required String shipperId}) async {
  print('reached2');
  final String shipperApiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  final String additionalQuery = '/';
  print("$shipperApiUrl$additionalQuery$shipperId");
  print(toBeUpdated);
  String body = json.encode(toBeUpdated);
  final http.Response response = await http.put(
      Uri.parse("$shipperApiUrl$additionalQuery$shipperId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: body);
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (decodedResponse["status"].toString() == "Success") {
      print("Success");
    } else {
      print("Error");
    }
  } else {
    print("Error");
  }
}
