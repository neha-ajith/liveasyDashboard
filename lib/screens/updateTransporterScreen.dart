import 'package:flutter/material.dart';

class UpdateTransporterScreen extends StatefulWidget {
  final List transporterDetails = [];
  UpdateTransporterScreen({Key? key, required transporterDetails})
      : super(key: key);

  @override
  _UpdateTransporterScreenState createState() =>
      _UpdateTransporterScreenState();
}

class _UpdateTransporterScreenState extends State<UpdateTransporterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container()));
  }
}
