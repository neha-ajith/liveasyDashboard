import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/getTransporterApi.dart';

class TransporterDetailsScreen extends StatefulWidget {
  const TransporterDetailsScreen({Key? key}) : super(key: key);

  @override
  _TransporterDetailsScreenState createState() =>
      _TransporterDetailsScreenState();
}

class _TransporterDetailsScreenState extends State<TransporterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    runGetTransporterApi(true);
    runGetTransporterApi(false);
    return Container();
  }
}
