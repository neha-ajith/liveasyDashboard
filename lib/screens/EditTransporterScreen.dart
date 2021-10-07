import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/functions/updateTransporterStatus.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:liveasy_admin/widgets/cancelButtonWidget.dart';
import 'package:liveasy_admin/widgets/completeDialog.dart';
import 'package:liveasy_admin/widgets/radioButtonWidget.dart';
import 'package:liveasy_admin/widgets/updateScreenCardLayout.dart';
import 'package:liveasy_admin/widgets/updateScreenTextField.dart';

class EditTransporterDetails extends StatelessWidget {

  List dataList;
  final TransporterDetailsModel transporterDetails;
  EditTransporterDetails({required this.dataList, required this.transporterDetails});

  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  FocusNode nameFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode companyFocusNode = FocusNode();
  bool isNameEditable = false;
  bool isLocationEditable = false;
  bool isCompanyNameEditable = false;

  TransporterController transporterController = Get.find<TransporterController>();

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController(text: transporterDetails.transporterName);
    transporterController.updateTransporterName(
        transporterDetails.transporterName == null ? "" : transporterDetails.transporterName!);

    TextEditingController contact = TextEditingController(text: transporterDetails.phoneNo);

    TextEditingController location = TextEditingController(text: transporterDetails.transporterLocation);
    transporterController.updateTransporterLocation(
        transporterDetails.transporterLocation == null ? "" : transporterDetails.transporterLocation!);

    TextEditingController companyName = TextEditingController(text: transporterDetails.companyName);
    transporterController.updateTransporterCompanyName(
        transporterDetails.companyName == null ? "" : transporterDetails.companyName!);

    transporterController.updateOnTransporterApproval(transporterDetails.transporterApproved! ? 1 : 2);
    transporterController.updateCompanyProofApproval(transporterDetails.companyApproved! ?1 :2);

    return Column(
      children: [
        SizedBox(height: height * 37),
        Container(
            height: height * 40, width: width * 240,alignment: Alignment.topLeft,
            child: FittedBox(fit: BoxFit.cover,
                child: Text('Transporter details', style: TextStyle(
                    fontSize: 32, color: greyColor, fontWeight: regularWeight)))),
        SizedBox(height: height * 30),
        Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            shadowColor: black,
            elevation: 2.0,
            child: Container(
              width: width * 1138,
              padding: EdgeInsets.symmetric(vertical: height * 46, horizontal: width * 64),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: height * 34, width: width * 230,
                      child: FittedBox(fit: BoxFit.cover,
                          child: Text('Edit information', style: TextStyle(fontSize: 28, color: greyColor,
                              fontWeight: regularWeight)))),
                  SizedBox(height: height * 35),
                  Center(
                      child: Container(
                          height: height * 63, width: width * 63,
                          child: FittedBox(fit: BoxFit.cover,
                              child: dataList[0] != null ? CircleAvatar(backgroundImage: NetworkImage(dataList[0],))
                                : Image.asset("icons/profile.png")
                          ))),
                  SizedBox(height: height * 70),
                  Row(children: [
                    Container(
                        height: height * 18, width: width * 48,
                        child: FittedBox(fit: BoxFit.cover,
                            child: Text('Name', style: TextStyle(
                                color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                    SizedBox(width: width * 342),
                    Container(
                        height: height * 20,
                        width: width * 60,
                        child: FittedBox(fit: BoxFit.cover,
                            child: Text('Contact',
                                style: TextStyle(color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                    SizedBox(width: width * 240),
                    Container(
                        height: height * 18,
                        width: width * 60,
                        child: FittedBox(fit: BoxFit.cover,
                            child: Text('Location', style: TextStyle(
                                color: greyColor, fontWeight: boldWeight, fontSize: 14))))
                  ]),
                  SizedBox(height: height * 10),
                  Row(children: [
                    UpdateScreenTextField(
                        type: "Transporter",
                        labelText: "Name",
                        controller: name,
                        editable: isNameEditable,
                        focusNode: nameFocusNode),
                    SizedBox(width: width * 130),
                    UpdateScreenTextField(
                        type: "Transporter",
                        labelText: "Contact",
                        controller: contact,
                        editable: false),
                    SizedBox(width: width * 130),
                    UpdateScreenTextField(
                        type: "Transporter",
                        labelText: "Location",
                        controller: location,
                        editable: isLocationEditable,
                        focusNode: locationFocusNode)
                  ]),
                  SizedBox(height: height * 30),
                  Container(height: height * 18, width: width * 132,
                      child: FittedBox(fit: BoxFit.cover,
                          child: Text('Document image', style: TextStyle(color: greyColor,
                                  fontWeight: boldWeight, fontSize: 14)))),
                  SizedBox(height: height * 15),
                  Obx(() {
                    return DocumentImageLayout(
                        type: "Transporter",
                        pan: dataList[1] != null ?dataList[1] : null,
                        aadhar1: dataList[3] != null ?dataList[3] : null,
                        aadhar2: dataList[5] != null ?dataList[5] : null,
                        panApproved: transporterController.identityProofApprovalStatus.value,
                        aadhar1Approved: transporterController.addressProofFrontApprovalStatus.value,
                        aadhar2Approved: transporterController.addressProofBacktApprovalStatus.value);}),
                  SizedBox(height: height * 50),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 18,
                            width: width * 121,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Company Name',
                                    style: TextStyle(color: greyColor, fontWeight: boldWeight, fontSize: 10)))),
                        SizedBox(width: width * 269),
                        Container(
                            height: height * 18,
                            width: width * 180,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Transporter Approval ?',
                                    style: TextStyle(color: greyColor, fontWeight: boldWeight, fontSize: 10)))),
                        SizedBox(width: width * 140),
                        Container(
                            height: height * 18,
                            width: width * 160,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Company Approval ?',
                                    style: TextStyle(color: greyColor, fontWeight: boldWeight, fontSize: 10))))
                      ]),
                  SizedBox(height: height * 15),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UpdateScreenTextField(
                            type: "Transporter",
                            labelText: "Company Name",
                            controller: companyName,
                            editable: isCompanyNameEditable,
                            focusNode: companyFocusNode),
                        SizedBox(width: width * 122),
                        RadioButtonWidget(type: "TransporterApproval"),
                        SizedBox(width: width * 72),
                        RadioButtonWidget(type: "TransporterCompanyApprovedStatus")
                      ]),
                  SizedBox(height: height * 50),
                  Container(
                      height: height * 18,
                      width: width * 130,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Company Details',
                              style: TextStyle(color: greyColor, fontWeight: boldWeight, fontSize: 10)))),
                  SizedBox(height: height * 16),
                  CompanyProofLayout(
                    companyProofApproved: transporterController.companyProofApprovalStatus.value,
                    gst: dataList[7] != null ? dataList[7] : null,
                  ),
                  SizedBox(height: height * 45),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: signInColor,
                              fixedSize: Size(width * 165, height * 32),
                              shape: RoundedRectangleBorder(side: BorderSide(color: black),
                                  borderRadius: BorderRadius.circular(radius_3 + 1)),
                            ),
                            onPressed: () async {
                              Map<String, dynamic> detailsForUpdate = {};
                              detailsForUpdate['transporterName'] = name.text;
                              detailsForUpdate['transporterLocation'] = location.text;
                              detailsForUpdate['companyName'] = companyName.text;
                              transporterController.transporterApprovalStatus.value == 1
                                  ? detailsForUpdate['transporterApproved'] = true
                                  : detailsForUpdate['transporterApproved'] = false;
                              transporterController.companyProofApproval.value == 1
                                  ? detailsForUpdate['companyApproved'] = true
                                  : detailsForUpdate['companyApproved'] = false;
                              var statusCode = await updateTransporterStatus(detailsForUpdate: detailsForUpdate, userId: transporterDetails.transporterId);
                              if(statusCode == 200){
                                showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return completedDialog(
                                      upperDialogText: 'Transporter Status',
                                      lowerDialogText:'Successfully Updated'
                                    );
                                  },
                                );
                                Timer(Duration(seconds: 3), () => {Navigator.of(context).pop()});

                              }
                              },
                            child: Container(
                                height: height * 18, width: width * 109,
                                child: FittedBox(fit: BoxFit.cover,
                                    child: Text('Save Changes',
                                        style: TextStyle(fontStyle: FontStyle.normal, color: white,
                                            fontSize: 16, fontWeight: regularWeight))))),
                        SizedBox(width: width * 50),
                        CancelButtonWidget()
                      ])],),)),
        SizedBox(height: height * 50)
      ],
    );
  }
}