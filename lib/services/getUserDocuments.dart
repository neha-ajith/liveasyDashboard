import 'package:liveasy_admin/models/documentApiModel.dart';
import 'package:liveasy_admin/functions/getDocument.dart';

Future<List<String?>> getUserDocumentURL(userId) async {
  String? profile, aadhar1, aadhar2, pan, gst;
  final List<DocumentModel> docList = await runGetDocumentsApi(userId);
  for (var document in docList) {
    switch (document.documentType) {
      case "Profile":
        {
          profile = document.documentLink;
        }
        break;
      case "Aadhar1":
        {
          aadhar1 = document.documentLink;
        }
        break;
      case "Adhar2":
        {
          aadhar2 = document.documentLink;
        }
        break;
      case "PAN":
        {
          pan = document.documentLink;
        }
        break;
      case "GST":
        {
          gst = document.documentLink;
        }
    }
  }
  return [profile, aadhar1, aadhar2, pan, gst];
}
