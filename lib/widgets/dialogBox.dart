import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/functions/delShipperApi.dart';
import 'package:liveasy_admin/functions/delTransporterApi.dart';

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
                SizedBox(height: height * 150),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, fontFamily: "montserrat")),
                SizedBox(height: height * 120),
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
                        child: Text('Confirm'),
                        onPressed: () async {
                          if (userId!.startsWith("shipper")) {
                            await runDeleteShipperApi(userId!);
                            ShipperController shipperController =
                                Get.find<ShipperController>();
                            shipperController.updateOnShipperDelete(true);
                          } else {
                            await runDeleteTransporterApi(userId!);
                            TransporterController transporterController =
                                Get.find<TransporterController>();
                            transporterController
                                .updateOnTransporterDelete(true);
                          }
                          Navigator.of(context).pop();
                        }),
                    SizedBox(width: width * 40),
                    TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ])
                else if (title.startsWith("Error"))
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                        onPressed: () {
                          switch (type) {
                            case "Shipper":
                              ShipperController shipperController =
                                  Get.find<ShipperController>();
                              shipperController.onShipperAPIfails(true);
                              Navigator.of(context).pop();
                              break;
                            case ("Transporter"):
                              TransporterController transporterController =
                                  Get.find<TransporterController>();
                              transporterController.onTransporterAPIfails(true);
                              Navigator.of(context).pop();
                              break;
                            case ("ShipperDocuments"):
                              ShipperController shipperController =
                                  Get.find<ShipperController>();
                              shipperController.onShipperDocumentfails(true);
                              break;
                            case ("TransporterDocuments"):
                              TransporterController transporterController =
                                  Get.find<TransporterController>();
                              transporterController
                                  .onTransporterDocumentsfails(true);
                              break;
                          }
                        },
                        child: Text("OK",
                            style: TextStyle(
                                color: black, fontFamily: 'montserrat'))),
                    SizedBox(width: width * 40),
                    TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ])
              ]))
        ])));
  }
}
