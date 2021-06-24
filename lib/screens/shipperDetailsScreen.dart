import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/getShipperApi.dart';

class ShipperDetailsScreen extends StatefulWidget {
  const ShipperDetailsScreen({Key? key}) : super(key: key);

  @override
  _ShipperDetailsScreenState createState() => _ShipperDetailsScreenState();
}

class _ShipperDetailsScreenState extends State<ShipperDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    runGetShipperApi(true);
    runGetShipperApi(false);
    return Container();
  }
}
