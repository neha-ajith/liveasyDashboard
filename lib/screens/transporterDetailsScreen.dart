import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/functions/getTransporterApi.dart';
import 'package:liveasy_admin/services/transporterDataSource.dart';
import 'package:liveasy_admin/widgets/filterButtonWidget.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/services/showDialog.dart';
import 'package:liveasy_admin/widgets/tableStructure.dart';

class TransporterDetailsScreen extends StatefulWidget {
  @override
  _TransporterDetailsScreenState createState() =>
      _TransporterDetailsScreenState();
}

class _TransporterDetailsScreenState extends State<TransporterDetailsScreen> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  TransporterController transporterController =
      Get.put(TransporterController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 37),
              Row(children: [
                Container(
                    height: height * 40,
                    width: width * 240,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text('Transporter details',
                            style: TextStyle(fontSize: 32)))),
                SizedBox(width: width * 727),
                FilterButtonWidget(type: "Transporter")
              ]),
              SizedBox(height: height * 30),
              Container(
                  width: width * 1137,
                  child: Obx(() {
                    transporterController.transporterDeleted.value;
                    transporterController.transporterAPIfailed.value;
                    return FutureBuilder(
                        future: runGetTransporterApi(transporterController
                            .choosenTransporterFilter.value),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              if (snapshot.data.length == 0) {
                                return Center(child: Text('NO Data'));
                              } else {
                                var dts = TransporterDataSource(
                                    data: snapshot.data, context: context);
                                return TableStructure(
                                    type: "Transporter", dts: dts);
                              }
                            } else {
                              Future(() {
                                dialogBox(
                                    context,
                                    'Error Loading Transporter Details',
                                    'Unable to Fetch Transporter Details\nPlease try again later',
                                    null,
                                    "Transporter");
                              });
                              return Container();
                            }
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        });
                  }))
            ]));
  }
}
