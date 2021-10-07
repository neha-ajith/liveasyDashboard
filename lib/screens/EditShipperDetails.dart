import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/widgets/cancelButtonWidget.dart';
import 'package:liveasy_admin/widgets/radioButtonWidget.dart';
import 'package:liveasy_admin/widgets/updateScreenCardLayout.dart';
import 'package:liveasy_admin/widgets/updateScreenTextField.dart';


class EditShipperDetails extends StatelessWidget {

  List dataList;
  final ShipperDetailsModel shipperDetails;
  EditShipperDetails({required this.dataList, required this.shipperDetails});

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

    TextEditingController name =
    TextEditingController(text:shipperDetails.shipperName);
    shipperController.updateShipperName(
        shipperDetails.shipperName == null ? "" : shipperDetails.shipperName!);
    TextEditingController contact = TextEditingController(text: shipperDetails.phoneNo);
    TextEditingController location = TextEditingController(text: shipperDetails.shipperLocation);
    shipperController.updateShipperLocation(
        shipperDetails.shipperLocation == null ? "" : shipperDetails.shipperLocation!);
    TextEditingController companyName = TextEditingController(text: shipperDetails.companyName);
    shipperController.updateShipperCompanyName(
        shipperDetails.companyName == null ? "" : shipperDetails.companyName!);

    shipperController.updateOnShipperApproval(shipperDetails.companyApproved! ? 1 : 2);
    shipperController.updateShipperAccountVerification(shipperDetails.accountVerificationInProgress! ? 2 : 1);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 37),
          Container(
              height: height * 40,
              width: width * 240,
              child: FittedBox(fit: BoxFit.cover,
                  child: Text('Shipper details', style: TextStyle(
                          fontSize: 32, color: greyColor, fontWeight: regularWeight)))),
          SizedBox(height: height * 30),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              shadowColor: black,
              elevation: 2.0,
              child: Container(
                  width: width * 1138,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 46,
                      horizontal: width * 64),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 34,
                            width: width * 230,
                            child: FittedBox(fit: BoxFit.cover,
                                child: Text('Edit information', style: TextStyle(
                                        fontSize: 28, color: greyColor, fontWeight: regularWeight)))),
                        SizedBox(height: height * 35),
                        if (dataList[0] == null)
                          Center(
                              child: Container(
                                  height: height * 63,
                                  width: width * 63,
                                  child: FittedBox(fit: BoxFit.cover,
                                      child: Image.asset("icons/profile.png"))))
                        else
                          Center(
                              child: Container(
                                  height: height * 63,
                                  width: width * 63,
                                  child: FittedBox(fit: BoxFit.cover,
                                      child: CircleAvatar(child: Image.network(dataList[0]))))),
                        SizedBox(height: height * 70),
                        Row(children: [
                          Container(
                              height: height * 18,
                              width: width * 48,
                              child: FittedBox(fit: BoxFit.cover,
                                  child: Text('Name', style: TextStyle(
                                          color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                          SizedBox(width: width * 342),
                          Container(
                              height: height * 20,
                              width: width * 60,
                              child: FittedBox(fit: BoxFit.cover,
                                  child: Text('Contact', style: TextStyle(
                                          color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                          SizedBox(width: width * 240),
                          Container(
                              height: height * 18,
                              width: width * 68,
                              child: FittedBox(fit: BoxFit.cover,
                                  child: Text('Location', style: TextStyle(
                                          color: greyColor, fontWeight: boldWeight, fontSize: 14))))
                        ]),
                        SizedBox(height: height * 10),
                        Row(children: [
                          UpdateScreenTextField(
                              type: "Shipper",
                              labelText: "Name",
                              controller: name,
                              editable: isNameEditable,
                              focusNode: nameFocusNode),
                          SizedBox(width: width * 130),
                          UpdateScreenTextField(
                              type: "Shipper",
                              labelText: "Contact",
                              controller: contact,
                              editable: false),
                          SizedBox(width: width * 130),
                          UpdateScreenTextField(
                              type: "Shipper",
                              labelText: "Location",
                              controller: location,
                              editable: isLocationEditable,
                              focusNode: locationFocusNode)
                        ]),
                        SizedBox(height: height * 30),
                        Container(
                            height: height * 18,
                            width: width * 132,
                            child: FittedBox(fit: BoxFit.cover,
                                child: Text('Document image', style: TextStyle(
                                        color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                        SizedBox(height: height * 15),
                        Obx(() {
                          return DocumentImageLayout(
                              type: "Shipper",
                              pan: dataList[1],
                              aadhar1: dataList[3],
                              aadhar2: dataList[5],
                              panApproved: shipperController.identityProofApprovalStatus.value,
                              aadhar1Approved: shipperController.addressProofFrontApprovalStatus.value,
                              aadhar2Approved: shipperController.addressProofBacktApprovalStatus.value);
                        }),
                        SizedBox(height: height * 50),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: height * 18,
                                  width: width * 121,
                                  child: FittedBox(fit: BoxFit.cover,
                                      child: Text('Company Name', style: TextStyle(
                                              color: greyColor, fontWeight: boldWeight, fontSize: 10)))),
                              SizedBox(width: width * 269),
                              Container(
                                  height: height * 18,
                                  width: width * 150,
                                  child: FittedBox(fit: BoxFit.cover,
                                      child: Text('Shipper Appoval ?', style: TextStyle(
                                              color: greyColor, fontWeight: boldWeight, fontSize: 14)))),
                              SizedBox(width: width * 150),
                              Container(
                                  height: height * 18,
                                  width: width * 180,
                                  child: FittedBox(fit: BoxFit.cover,
                                      child: Text('Account Verification?', style: TextStyle(
                                              color: greyColor, fontWeight: boldWeight, fontSize: 14))))
                            ]),
                        SizedBox(height: height * 15),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              UpdateScreenTextField(
                                  type: "Shipper",
                                  labelText: "Company Name",
                                  controller: companyName,
                                  editable:
                                  isCompanyNameEditable,
                                  focusNode: companyFocusNode),
                              SizedBox(width: width * 122),
                              RadioButtonWidget(type: "ShipperApproval"),
                              SizedBox(width: width * 72),
                              RadioButtonWidget(type: "ShipperAccountVerification")
                            ]),
                        SizedBox(height: height * 50),
                        Container(
                            height: height * 18,
                            width: width * 130,
                            child: FittedBox(fit: BoxFit.cover,
                                child: Text('Company Details', style: TextStyle(
                                        color: greyColor, fontWeight: boldWeight, fontSize: 10)))),
                        SizedBox(height: height * 16),
                        Obx(() {
                          return CompanyProofLayout(
                              gst: dataList[7],
                              companyProofApproved: shipperController.companyProofApprovalStatus.value);
                        }),
                        SizedBox(height: height * 45),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: signInColor,
                                    fixedSize: Size(width * 165, height * 32),
                                    shape: RoundedRectangleBorder(side: BorderSide(color: black),
                                        borderRadius: BorderRadius.circular(radius_3 + 1)),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                      height: height * 18, width: width * 109,
                                      child: FittedBox(fit: BoxFit.cover,
                                          child: Text('Save Changes',
                                              style: TextStyle(fontStyle: FontStyle.normal, color: white,
                                                  fontSize: 16, fontWeight: regularWeight))))),
                              SizedBox(width: width * 50),
                              CancelButtonWidget()
                            ])
                      ]))),
          SizedBox(height: height * 50)
        ]);
  }
}

