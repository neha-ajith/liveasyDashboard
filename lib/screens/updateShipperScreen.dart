import 'package:flutter/material.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/services/getUserDocuments.dart';
import 'package:liveasy_admin/widgets/appBar.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'EditShipperDetails.dart';

class UpdateShipperScreen extends StatefulWidget {
  final ShipperDetailsModel shipperDetails;
  UpdateShipperScreen({required this.shipperDetails});

  @override
  _UpdateShipperScreenState createState() => _UpdateShipperScreenState();
}

class _UpdateShipperScreenState extends State<UpdateShipperScreen> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  FocusNode nameFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode companyFocusNode = FocusNode();
  bool isNameEditable = false;
  bool isLocationEditable = false;
  bool isCompanyNameEditable = false;
  ShipperController shipperController = Get.find<ShipperController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(child: Center(child: Obx(() {
          shipperController.shipperDocumentAPIfailed.value;
          return FutureBuilder(
              future: getUserDocumentURL(widget.shipperDetails.shipperId!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    List list = [null,null,null,null,null,null,null,null,null];
                    return EditShipperDetails(dataList: list,shipperDetails: widget.shipperDetails,);
                    }else {
                    return EditShipperDetails(dataList: snapshot.data,shipperDetails: widget.shipperDetails,);
                    }
                  }
                }
              );
        }))));
  }
}
