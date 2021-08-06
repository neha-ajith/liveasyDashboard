import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'accessingurl.dart' as ac;

Future<void> runDeleteUserApi(String type, String userId) async {
  String apiUrl;
  if (type == "Shipper") {
    //apiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
    List<String> li = await Future.wait<String>([
      ac.getshipperurl(),
    ]);
    apiUrl = li[0];
  } else {
    //apiUrl = '${dotenv.env['transporterApiUrl'].toString()}';
    List<String> li = await Future.wait<String>([
      ac.gettransporterurl(),
    ]);
    apiUrl = li[0];
  }

  final String additionalQuery = '/';
  http.Response response =
  await http.delete(Uri.parse("$apiUrl$additionalQuery$userId"));
  var jsonData = json.decode(response.body);
  print(jsonData["status"]);
}
