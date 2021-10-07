import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/services/getUserDocuments.dart';
import 'package:liveasy_admin/widgets/appBar.dart';
import 'EditTransporterScreen.dart';

class UpdateTransporterScreen extends StatefulWidget {
  final TransporterDetailsModel transporterDetails;
  UpdateTransporterScreen({required this.transporterDetails});

  @override
  _UpdateTransporterScreenState createState() => _UpdateTransporterScreenState();
}

class _UpdateTransporterScreenState extends State<UpdateTransporterScreen> {

  TransporterController transporterController = Get.find<TransporterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(child: Center(child: Obx(() {
        transporterController.transporterDocumentAPIfailed.value;
        return  FutureBuilder(
            future: getUserDocumentURL(widget.transporterDetails.transporterId!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }else{
                if (!snapshot.hasData) {
                  List list = [null,null,null,null,null,null,null,null,null];
                  return EditTransporterDetails(dataList: list,transporterDetails: widget.transporterDetails,);
                }else {
                  return EditTransporterDetails(dataList: snapshot.data,transporterDetails: widget.transporterDetails,);
                }
              }
            }); }
      ),)
      ),);
  }
}


