import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/functions/getTransporterApi.dart';
import 'package:liveasy_admin/services/transporterDataSource.dart';
import 'package:liveasy_admin/widgets/filterButtonWidget.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

class TransporterDetailsScreen extends StatefulWidget {
  const TransporterDetailsScreen({Key? key}) : super(key: key);

  @override
  _TransporterDetailsScreenState createState() =>
      _TransporterDetailsScreenState();
}

class _TransporterDetailsScreenState extends State<TransporterDetailsScreen> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  TransporterController transporterController =
      Get.put(TransporterController());

  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: safeBlockVertical * 37),
          Row(children: [
            Text('Transporter details', style: TextStyle(fontSize: size_32)),
            SizedBox(width: safeBlockHorizontal * 727),
            FilterButtonWidget(type: "Transporter")
          ]),
          SizedBox(height: safeBlockVertical * 30),
          Container(
              height: safeBlockVertical * 842,
              width: safeBlockHorizontal * 1137,
              child: Obx(() {
                transporterController.onTransporterDeleted.value;
                return FutureBuilder(
                    future: runGetTransporterApi(
                        transporterController.choosenTransporterFilter.value),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(child: Text('Loading'));
                      } else if (snapshot.data.length == 0) {
                        return Center(child: Text('NO Data'));
                      } else {
                        var dts = DataSource(
                            data: snapshot.data, context: mainContext);
                        int _rowsPerPage = 5;
                        int _rowsPerPage1 = 5;
                        var tableItemsCount = dts.rowCount;
                        var defaultRowsPerPage = 5;
                        var isRowCountLessDefault =
                            tableItemsCount < defaultRowsPerPage;
                        _rowsPerPage = isRowCountLessDefault
                            ? tableItemsCount
                            : defaultRowsPerPage;
                        return PaginatedDataTable(
                          columnSpacing: safeBlockHorizontal * 33,
                          dataRowHeight: safeBlockVertical * 130,
                          availableRowsPerPage: [5, 10, 15, 20, 25],
                          source: dts,
                          rowsPerPage: isRowCountLessDefault
                              ? _rowsPerPage
                              : _rowsPerPage1,
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(
                                label: Text('Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Contact',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Location',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Company name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Status',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                            DataColumn(
                                label: Text('Actions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: boldWeight))),
                          ],
                          onRowsPerPageChanged: isRowCountLessDefault
                              ? null
                              : (rowCount) {
                                  setState(() {
                                    _rowsPerPage1 = rowCount!;
                                  });
                                },
                        );
                      }
                    });
              }))
        ]);
  }
}
