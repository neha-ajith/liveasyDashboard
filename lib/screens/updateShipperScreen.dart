import 'package:flutter/material.dart';

class UpdateShipperScreen extends StatefulWidget {
  final List shipperDetails = [];
  UpdateShipperScreen({Key? key, required shipperDetails}) : super(key: key);

  @override
  _UpdateShipperScreenState createState() => _UpdateShipperScreenState();
}

class _UpdateShipperScreenState extends State<UpdateShipperScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container()));
  }
}
