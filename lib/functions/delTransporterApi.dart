import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> runDeleteTransporterApi(String transporterId) async {
  final String transporterApiUrl =
      '${dotenv.env['transporterApiUrl'].toString()}';
  final String additionalQuery = '/';

  var jsonData;
  http.Response response = await http
      .delete(Uri.parse("$transporterApiUrl$additionalQuery$transporterId"));
  jsonData = json.decode(response.body);
  print(jsonData["status"]);
}
