import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/functions/delUserApi.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  String title, description;
  String? userId, type;
  DialogBox(
      {required this.title, required this.description, this.userId, this.type});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Stack(children: [
          Container(
              width: width * 400,
              height: height * 500,
              padding: EdgeInsets.only(top: height * 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: black,
                        fontWeight: boldWeight,
                        fontFamily: "montserrat")),
                SizedBox(height: height * 120),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, fontFamily: "montserrat")),
                SizedBox(height: height * 100),
                if (title == "Login Failed")
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK",
                          style: TextStyle(
                              color: black, fontFamily: 'montserrat')))
                else if (title == "Alert")
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                        child: type == "NonDismissible"
                            ? Text('OK')
                            : Text('Confirm'),
                        onPressed: () async {
                          if (type == "NonDismissible") {
                            Navigator.of(context).pop();
                          } else if (userId!.startsWith("shipper")) {
                            await runDeleteUserApi('Shipper', userId!);
                            ShipperController shipperController =
                                Get.find<ShipperController>();
                            shipperController.updateOnShipperDeleted(true);
                            Navigator.of(context).pop();
                          } else if (userId!.startsWith("transporter")) {
                            await runDeleteUserApi('Transporter', userId!);
                            TransporterController transporterController =
                                Get.find<TransporterController>();
                            transporterController
                                .updateOnTransporterDeleted(true);
                            Navigator.of(context).pop();
                          }
                        }),
                    SizedBox(width: width * 40),
                    if (type != "NonDismissible")
                      TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                  ])
                else if (title.startsWith("Error"))
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                        child: Text("OK",
                            style: TextStyle(
                                color: black, fontFamily: 'montserrat')),
                        onPressed: () {
                          switch (type) {
                            case "Shipper":
                              ShipperController shipperController =
                                  Get.find<ShipperController>();
                              shipperController.retryOnShipperAPIfail(true);
                              Navigator.of(context).pop();
                              break;
                            case ("Transporter"):
                              TransporterController transporterController =
                                  Get.find<TransporterController>();
                              transporterController
                                  .retryOnTransporterAPIfail(true);
                              Navigator.of(context).pop();
                              break;
                            case ("ShipperDocuments"):
                              ShipperController shipperController =
                                  Get.find<ShipperController>();
                              shipperController
                                  .retryOnShipperDocumentfail(true);
                              Navigator.of(context).pop();
                              break;
                            case ("TransporterDocuments"):
                              TransporterController transporterController =
                                  Get.find<TransporterController>();
                              transporterController
                                  .retryOnTransporterDocumentfail(true);
                              Navigator.of(context).pop();
                              break;
                            case ("DataNotUpdated"):
                              Navigator.of(context).pop();
                          }
                        }),
                    if (type != "DataNotUpdate") SizedBox(width: width * 40),
                    if (type != "DataNotUpdate")
                      TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            if (type == "ShipperDocuments" ||
                                type == "TransporterDocuments") {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pop();
                            }
                          })
                  ])
              ]))
        ])));
  }
}
