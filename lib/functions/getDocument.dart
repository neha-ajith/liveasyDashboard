import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liveasy_admin/models/documentApiModel.dart';
import 'package:liveasy_admin/functions/accessingurl.dart' as ac;

Future<List<DocumentModel>> runGetDocumentsApi(String entityId) async {
  List<String> li = await Future.wait<String>([
    ac.getdocumenturl(),
  ]);
  final String documentApiUrl = li[0];

  final String additionalQuery = '/';
  List<DocumentModel> docList = [];
  http.Response response =
      await http.get(Uri.parse("$documentApiUrl$additionalQuery$entityId"));
  var jsonData = json.decode(response.body);
  for (var json in jsonData["documents"]) {
    DocumentModel documentModel = DocumentModel();
    documentModel.documentId = json["documentId"];
    documentModel.documentType = json["documentType"];
    documentModel.documentLink = json["documentLink"];
    documentModel.verified = json["verified"];
    documentModel.id = json["id"];
    docList.add(documentModel);
  }
  return docList;
}
