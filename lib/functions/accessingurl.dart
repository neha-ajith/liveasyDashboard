import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getshipperurl() async {
  String shipper = "";
  var result = await FirebaseFirestore.instance.collection('urls').get();
  result.docs.forEach((res) {
    shipper = res.data()['shipperApiUrl'];
  });
  return shipper;
}

Future<String> gettransporterurl() async {
  String transporter = "";
  var result = await FirebaseFirestore.instance.collection('urls').get();
  result.docs.forEach((res) {
    transporter = res.data()['transporterApiUrl'];
    // print(res.data());
  });
  return transporter;
}

Future<String> getBookingUrl() async {
  String booking = "";
  var result = await FirebaseFirestore.instance.collection('urls').get();
  print(result.docs);
  result.docs.forEach((res) {
    booking = res.data()['bookingApiUrl'];
  });
  print(booking);

  return booking;
}

Future<String> getdocumenturl() async {
  String document = "";
  var result = await FirebaseFirestore.instance.collection('urls').get();
  result.docs.forEach((res) {
    document = res.data()['documentApiUrl'];
  });
  return document;
}

//firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('.env');
//Uint8List? downloadedData  =  await ref.getData();
//print(utf8.decode(downloadedData!));*/
