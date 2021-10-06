import 'package:liveasy_admin/models/documentApiModel.dart';
import 'package:liveasy_admin/functions/getDocument.dart';

Future<List<dynamic>> getUserDocumentURL(userId) async {
  String? profile, aadhar1, aadhar2, pan, gst;
  bool? identityProofApproved,
      addressProofFrontApproved,
      addressProofBackApproved,
      companyProofApproved;
  final List<DocumentModel> docList = await runGetDocumentsApi(userId);
  if (docList.isNotEmpty) {
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
            addressProofFrontApproved = document.verified;
          }
          break;
        case "Aadhar2":
          {
            aadhar2 = document.documentLink;
            addressProofBackApproved = document.verified;
          }
          break;
        case "PAN":
          {
            pan = document.documentLink;
            identityProofApproved = document.verified;
          }
          break;
        case "GST":
          {
            gst = document.documentLink;
            companyProofApproved = document.verified;
          }
      }
    }
    return [
      profile,
      pan,
      identityProofApproved,
      aadhar1,
      addressProofFrontApproved,
      aadhar2,
      addressProofBackApproved,
      gst,
      companyProofApproved
    ];
  } else {
    return [null, null, null, null, null, null, null, null, null];
  }
}
