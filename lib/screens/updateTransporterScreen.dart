import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/functions/updateDocumentApi.dart';
import 'package:liveasy_admin/functions/updateUserApi.dart';
import 'package:liveasy_admin/models/transporterApiModel.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/services/getUserDocuments.dart';
import 'package:liveasy_admin/widgets/appBar.dart';
import 'package:liveasy_admin/widgets/cancelButtonWidget.dart';
import 'package:liveasy_admin/services/showDialog.dart';
import 'package:liveasy_admin/widgets/radioButtonWidget.dart';
import 'package:liveasy_admin/widgets/saveButtonWidget.dart';
import 'package:liveasy_admin/widgets/updateScreenCardLayout.dart';
import 'package:liveasy_admin/widgets/updateScreenTextField.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

class UpdateTransporterScreen extends StatefulWidget {
  final TransporterDetailsModel transporterDetails;
  UpdateTransporterScreen({required this.transporterDetails});

  @override
  _UpdateTransporterScreenState createState() =>
      _UpdateTransporterScreenState();
}

class _UpdateTransporterScreenState extends State<UpdateTransporterScreen> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  FocusNode nameFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode companyFocusNode = FocusNode();
  bool isNameEditable = false;
  bool isLocationEditable = false;
  bool isCompanyNameEditable = false;
  List<bool?> documentVerificationStatus = [];
  Map<String, dynamic> dataToUpdate = {};
  Map<String, dynamic> documentDataToUpdate = {};
  List<Map<String, dynamic>> listofDocuments = [];
  Map<String, dynamic> documentData = {};
  TransporterController transporterController =
      Get.find<TransporterController>();

  Future<void> saveChangesOnPressed() async {
    if (transporterController.transporterName.value != "" &&
        widget.transporterDetails.transporterName !=
            transporterController.transporterName.value) {
      dataToUpdate.addAll(
          {'transporterName': transporterController.transporterName.value});
    }
    if (transporterController.transporterLocation.value != "" &&
        widget.transporterDetails.transporterLocation !=
            transporterController.transporterLocation.value) {
      dataToUpdate['transporterLocation'] =
          transporterController.transporterLocation.value;
    }
    if (transporterController.transporterCompanyName.value != "" &&
        widget.transporterDetails.companyName !=
            transporterController.transporterCompanyName.value) {
      dataToUpdate['companyName'] =
          transporterController.transporterCompanyName.value;
    }

    if (transporterController.identityProofApprovalStatus.value !=
        documentVerificationStatus[0]) {
      documentData = {'documentType': 'PAN'};
      documentData['verified'] =
          transporterController.identityProofApprovalStatus.value;
      listofDocuments.add(documentData);
    }
    if (transporterController.addressProofFrontApprovalStatus.value !=
        documentVerificationStatus[1]) {
      documentData = {'documentType': 'Aadhar1'};
      documentData['verified'] =
          transporterController.addressProofFrontApprovalStatus.value;
      listofDocuments.add(documentData);
    }
    if (transporterController.addressProofBacktApprovalStatus.value !=
        documentVerificationStatus[2]) {
      documentData = {'documentType': 'Aadhar2'};
      documentData['verified'] =
          transporterController.addressProofBacktApprovalStatus.value;
      listofDocuments.add(documentData);
    }
    if (transporterController.companyProofApprovalStatus.value !=
        documentVerificationStatus[3]) {
      documentData = {'documentType': 'GST'};
      documentData['verified'] =
          transporterController.companyProofApprovalStatus.value;
      listofDocuments.add(documentData);
    }

    bool changedTransporterApprovalStatus;
    if (transporterController.transporterApprovalStatus.value == 1) {
      changedTransporterApprovalStatus = true;
    } else {
      changedTransporterApprovalStatus = false;
    }
    if (changedTransporterApprovalStatus !=
        widget.transporterDetails.transporterApproved) {
      dataToUpdate
          .addAll({"transporterApproved": changedTransporterApprovalStatus});
    }

    bool changedTransporterProcessStatus;
    if (transporterController.transporterAccountVerficationInProgress.value ==
        2) {
      changedTransporterProcessStatus = true;
    } else {
      changedTransporterProcessStatus = false;
    }
    if (changedTransporterProcessStatus !=
        widget.transporterDetails.accountVerificationInProgress) {
      dataToUpdate.addAll(
          {"accountVerificationInProgress": changedTransporterProcessStatus});
    }

    if (transporterController.transporterApprovalStatus.value == 1) {
      if (transporterController.identityProofApprovalStatus.value &&
          transporterController.addressProofFrontApprovalStatus.value &&
          transporterController.addressProofBacktApprovalStatus.value &&
          transporterController.companyProofApprovalStatus.value) {
        if (transporterController.transporterName.value != "") {
          if (transporterController.transporterLocation.value != "") {
            if (transporterController.transporterCompanyName.value != "") {
              if (transporterController
                      .transporterAccountVerficationInProgress.value ==
                  1) {
                if (dataToUpdate.isNotEmpty) {
                  print('Transporter Data to Update');
                  print(dataToUpdate);
                  String status = await runPutUserApi(
                      type: "Transporter",
                      toBeUpdated: dataToUpdate,
                      userId: widget.transporterDetails.transporterId!);
                  if (status == "Error") {
                    dialogBox(
                        context,
                        'Error',
                        'User Details Not Updated\nPlease try again',
                        null,
                        'DataNotUpdated');
                  } else {
                    print("Nothing to Update");
                  }
                  if (listofDocuments.isNotEmpty) {
                    documentDataToUpdate["documents"] = listofDocuments;
                    documentDataToUpdate["entityId"] =
                        widget.transporterDetails.transporterId!;
                    print('Document Data to Update');
                    print(documentDataToUpdate);
                    String docUpdateStatus = await runPutDocumentApi(
                        toBeUpdated: documentDataToUpdate,
                        userId: widget.transporterDetails.transporterId!);
                    if (docUpdateStatus == "Error") {
                      dialogBox(
                          context,
                          "Error",
                          "Document Details Not Updated\nPlease try again",
                          null,
                          "DataNotUpdated");
                    } else {
                      Navigator.of(context).pop();
                    }
                  } else {
                    print("No Document to Update");
                    Navigator.of(context).pop();
                  }
                } else {
                  dialogBox(
                      context,
                      "Alert",
                      "Account Verification Process Status should be Completed not Pending\n Please make necessary changes",
                      null,
                      "NonDismissible");
                }
              } else {
                dialogBox(context, 'Alert', 'Company is not entered', null,
                    "NonDismissible");
              }
            } else {
              dialogBox(context, 'Alert', 'Transporter Location is not entered',
                  null, "NonDismissible");
            }
          } else {
            dialogBox(context, 'Alert', 'Transporter Name is not entered', null,
                "NonDismissible");
          }
        } else {
          dialogBox(
              context,
              'Alert',
              'All Documents should be approved\nApprove all documents OR Keep Company Approval Status On Halt',
              null,
              "NonDismissible");
        }
      } else if (transporterController
                  .transporterAccountVerficationInProgress.value ==
              2 &&
          transporterController.transporterApprovalStatus.value == 2) {
        if (dataToUpdate.isNotEmpty) {
          print('Transporter Data to Update');
          print(dataToUpdate);
          String status = await runPutUserApi(
              type: "Transporter",
              toBeUpdated: dataToUpdate,
              userId: widget.transporterDetails.transporterId!);
          if (status == "Error") {
            dialogBox(
                context,
                "Error",
                'User Details Not Updated\nPlease try again',
                null,
                "DataNotUpdated");
          }
        } else {
          print("Nothing to Update");
        }
        if (listofDocuments.isNotEmpty) {
          documentDataToUpdate["documents"] = listofDocuments;
          documentDataToUpdate["entityId"] =
              widget.transporterDetails.transporterId!;
          print('Document Data to Update');
          print(documentDataToUpdate);
          String docUpdateStatus = await runPutDocumentApi(
              toBeUpdated: dataToUpdate,
              userId: widget.transporterDetails.transporterId!);
          if (docUpdateStatus == "Error") {
            dialogBox(
                context,
                "Error",
                "Document Details Not Updated\nPlease try again",
                null,
                "DataNotUpdated");
          } else {
            Navigator.of(context).pop();
          }
        } else {
          print("No Document to Update");
          Navigator.of(context).pop();
        }
      } else if (transporterController
                  .transporterAccountVerficationInProgress.value ==
              1 &&
          transporterController.transporterApprovalStatus.value == 2) {
        if (dataToUpdate.isNotEmpty) {
          print("Transporter Data to Update");
          print(dataToUpdate);
          return showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Alert'),
                    content: Text('Are you sure you want to Reject this User'),
                    actions: [
                      TextButton(
                          child: Text('Confirm'),
                          onPressed: () async {
                            dataToUpdate.addAll({
                              "accountVerificationInProgress": false,
                              "companyApproved": false
                            });
                            String status = await runPutUserApi(
                                type: "Transporter",
                                toBeUpdated: dataToUpdate,
                                userId:
                                    widget.transporterDetails.transporterId!);
                            Navigator.of(context).pop();
                            if (status == "Error") {
                              dialogBox(
                                  context,
                                  'Error',
                                  'Details Not Update\nPlease try again',
                                  null,
                                  "DataNotUpdated");
                            }
                          }),
                      SizedBox(width: width * space_8),
                      TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ]);
              });
        } else {
          print("Nothing to update");
        }
        if (listofDocuments.isNotEmpty) {
          documentDataToUpdate["documents"] = listofDocuments;
          documentDataToUpdate["entityId"] =
              widget.transporterDetails.transporterId!;
          print('Document Data to Update');
          print(documentDataToUpdate);
          String docUpdateStatus = await runPutDocumentApi(
              toBeUpdated: dataToUpdate,
              userId: widget.transporterDetails.transporterId!);
          if (docUpdateStatus == "Error") {
            dialogBox(
                context,
                "Error",
                "Document Details Not Updated\nPlease try again",
                null,
                "DataNotUpdated");
          } else {
            Navigator.of(context).pop();
          }
        } else {
          print("No Document to Update");
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name =
        TextEditingController(text: widget.transporterDetails.transporterName);
    transporterController.updateTransporterName(
        widget.transporterDetails.transporterName == null
            ? ""
            : widget.transporterDetails.transporterName!);
    TextEditingController contact =
        TextEditingController(text: widget.transporterDetails.phoneNo);
    TextEditingController location = TextEditingController(
        text: widget.transporterDetails.transporterLocation);
    transporterController.updateTransporterLocation(
        widget.transporterDetails.transporterLocation == null
            ? ""
            : widget.transporterDetails.transporterLocation!);
    TextEditingController companyName =
        TextEditingController(text: widget.transporterDetails.companyName);
    transporterController.updateTransporterCompanyName(
        widget.transporterDetails.companyName == null
            ? ""
            : widget.transporterDetails.companyName!);
    transporterController.updateOnTransporterApproval(
        widget.transporterDetails.companyApproved! ? 1 : 2);
    transporterController.updateTransporterAccountVerification(
        widget.transporterDetails.accountVerificationInProgress! ? 2 : 1);
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(child: Center(child: Obx(() {
          transporterController.transporterDocumentAPIfailed.value;
          return FutureBuilder(
              future:
                  getUserDocumentURL(widget.transporterDetails.transporterId!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    Future(() {
                      dialogBox(
                          context,
                          'Error Loading Documents',
                          'Unable to Fetch the User Documents\nPlease try again later',
                          null,
                          "TransporterDocuments");
                    });
                    return Container();
                  } else {
                    documentVerificationStatus.addAll([
                      snapshot.data[2],
                      snapshot.data[4],
                      snapshot.data[6],
                      snapshot.data[8]
                    ]);
                    transporterController.updateIdentityProofApprovalStatus(
                        snapshot.data[2] != null ? snapshot.data[2] : false);
                    transporterController.updateAddressProofFrontApprovalStatus(
                        snapshot.data[4] != null ? snapshot.data[4] : false);
                    transporterController.updateAddressProofBackApprovalStatus(
                        snapshot.data[6] != null ? snapshot.data[6] : false);
                    transporterController.updateCompanyProofApprovalStatus(
                        snapshot.data[8] != null ? snapshot.data[8] : false);
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 37),
                          Container(
                              height: height * 40,
                              width: width * 240,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('Transporter details',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: greyColor,
                                          fontWeight: regularWeight)))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: height * 34,
                                            width: width * 230,
                                            child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text('Edit information',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: greyColor,
                                                        fontWeight:
                                                            regularWeight)))),
                                        SizedBox(height: height * 35),
                                        if (snapshot.data[0] == null)
                                          Center(
                                              child: Container(
                                                  height: height * 63,
                                                  width: width * 63,
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Image.asset(
                                                          "icons/profile.png"))))
                                        else
                                          Center(
                                              child: Container(
                                                  height: height * 63,
                                                  width: width * 63,
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: CircleAvatar(
                                                          child: Image.network(
                                                              snapshot
                                                                  .data[0]))))),
                                        SizedBox(height: height * 70),
                                        Row(children: [
                                          Container(
                                              height: height * 18,
                                              width: width * 48,
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text('Name',
                                                      style: TextStyle(
                                                          color: greyColor,
                                                          fontWeight:
                                                              boldWeight,
                                                          fontSize: 14)))),
                                          SizedBox(width: width * 342),
                                          Container(
                                              height: height * 20,
                                              width: width * 60,
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text('Contact',
                                                      style: TextStyle(
                                                          color: greyColor,
                                                          fontWeight:
                                                              boldWeight,
                                                          fontSize: 14)))),
                                          SizedBox(width: width * 240),
                                          Container(
                                              height: height * 18,
                                              width: width * 60,
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text('Location',
                                                      style: TextStyle(
                                                          color: greyColor,
                                                          fontWeight:
                                                              boldWeight,
                                                          fontSize: 14))))
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
                                        Container(
                                            height: height * 18,
                                            width: width * 132,
                                            child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text('Document image',
                                                    style: TextStyle(
                                                        color: greyColor,
                                                        fontWeight: boldWeight,
                                                        fontSize: 14)))),
                                        SizedBox(height: height * 15),
                                        Obx(() {
                                          return DocumentImageLayout(
                                              type: "Transporter",
                                              pan: snapshot.data[1],
                                              aadhar1: snapshot.data[3],
                                              aadhar2: snapshot.data[5],
                                              panApproved: transporterController
                                                  .identityProofApprovalStatus
                                                  .value,
                                              aadhar1Approved: transporterController
                                                  .addressProofFrontApprovalStatus
                                                  .value,
                                              aadhar2Approved: transporterController
                                                  .addressProofBacktApprovalStatus
                                                  .value);
                                        }),
                                        SizedBox(height: height * 50),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: height * 18,
                                                  width: width * 121,
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Text(
                                                          'Company Name',
                                                          style: TextStyle(
                                                              color: greyColor,
                                                              fontWeight:
                                                                  boldWeight,
                                                              fontSize: 10)))),
                                              SizedBox(width: width * 269),
                                              Container(
                                                  height: height * 18,
                                                  width: width * 150,
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Text(
                                                          'Transporter Appoval ?',
                                                          style: TextStyle(
                                                              color: greyColor,
                                                              fontWeight:
                                                                  boldWeight,
                                                              fontSize: 14)))),
                                              SizedBox(width: width * 150),
                                              Container(
                                                  height: height * 18,
                                                  width: width * 180,
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Text(
                                                          'Account Verification?',
                                                          style: TextStyle(
                                                              color: greyColor,
                                                              fontWeight:
                                                                  boldWeight,
                                                              fontSize: 14))))
                                            ]),
                                        SizedBox(height: height * 15),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              UpdateScreenTextField(
                                                  type: "Transporter",
                                                  labelText: "Company Name",
                                                  controller: companyName,
                                                  editable:
                                                      isCompanyNameEditable,
                                                  focusNode: companyFocusNode),
                                              SizedBox(width: width * 122),
                                              RadioButtonWidget(
                                                  type: "TransporterApproval"),
                                              SizedBox(width: width * 72),
                                              RadioButtonWidget(
                                                  type:
                                                      "TransporterAccountVerification")
                                            ]),
                                        SizedBox(height: height * 50),
                                        Container(
                                            height: height * 18,
                                            width: width * 130,
                                            child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text('Company Details',
                                                    style: TextStyle(
                                                        color: greyColor,
                                                        fontWeight: boldWeight,
                                                        fontSize: 10)))),
                                        SizedBox(height: height * 16),
                                        Obx(() {
                                          return CompanyProofLayout(
                                              gst: snapshot.data[7],
                                              companyProofApproved:
                                                  transporterController
                                                      .companyProofApprovalStatus
                                                      .value);
                                        }),
                                        SizedBox(height: height * 45),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SaveButtonWidget(
                                                  onPressed:
                                                      saveChangesOnPressed),
                                              SizedBox(width: width * 50),
                                              CancelButtonWidget()
                                            ])
                                      ]))),
                          SizedBox(height: height * 50)
                        ]);
                  }
                }
              });
        }))));
  }
}
