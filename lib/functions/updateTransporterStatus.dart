import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/functions/accessingurl.dart' as ac;



Future<int?> updateTransporterStatus({required Map<String, dynamic> detailsForUpdate, String? userId}) async{


  List<String> li = await Future.wait<String>([
    ac.gettransporterurl(),
  ]);
  final String transporterApiUrl = li[0];

    String body = json.encode(detailsForUpdate);

    final response = await http.put(Uri.parse("$transporterApiUrl/$userId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    print(response.body);

  return response.statusCode == 200 ? response.statusCode : 0 ;

}