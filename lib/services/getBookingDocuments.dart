import 'package:liveasy_admin/models/documentApiModel.dart';
import 'package:liveasy_admin/functions/getDocument.dart';

Future<List<dynamic>> getBookingDocumentURL(bookingId) async {
  String? lrPhoto1,
      lrPhoto2,
      lrPhoto3,
      lrPhoto4,
      eWayBillPhoto1,
      eWayBillPhoto2,
      eWayBillPhoto3,
      eWayBillPhoto4,
      wrPhoto1,
      wrPhoto2,
      wrPhoto3,
      wrPhoto4;

  final List<DocumentModel> docList = await runGetDocumentsApi(bookingId);
  if (docList.isNotEmpty) {
    for (var document in docList) {
      switch (document.documentType) {
        case "LrPhoto1":
          {
            lrPhoto1 = document.documentLink;
          }
          break;
        case "LrPhoto2":
          {
            lrPhoto2 = document.documentLink;
          }

          break;
        case "LrPhoto3":
          {
            lrPhoto3 = document.documentLink;
          }

          break;
        case "LrPhoto4":
          {
            lrPhoto4 = document.documentLink;
          }
          break;
        // eway bill
        case "EwayBillPhoto1":
          {
            eWayBillPhoto1 = document.documentLink;
          }
          break;
        case "EwayBillPhoto2":
          {
            eWayBillPhoto2 = document.documentLink;
          }
          break;
        case "EwayBillPhoto3":
          {
            eWayBillPhoto3 = document.documentLink;
          }
          break;
        case "EwayBillPhoto4":
          {
            eWayBillPhoto4 = document.documentLink;
          }
          break;
        // weight reciepts
        case "WeightReceiptPhoto1":
          {
            wrPhoto1 = document.documentLink;
          }
          break;
        case "WeightReceiptPhoto2":
          {
            wrPhoto2 = document.documentLink;
          }
          break;
        case "WeightReceiptPhoto3":
          {
            wrPhoto3 = document.documentLink;
          }
          break;
        case "WeightReceiptPhoto4":
          {
            wrPhoto4 = document.documentLink;
          }
          break;
        // pod photos
      }
    }
    return [
      lrPhoto1,
      lrPhoto2,
      lrPhoto3,
      lrPhoto4,
      eWayBillPhoto1,
      eWayBillPhoto2,
      eWayBillPhoto3,
      eWayBillPhoto4,
      wrPhoto1,
      wrPhoto2,
      wrPhoto3,
      wrPhoto4,
    ];
  } else {
    return [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null
    ];
  }
}
