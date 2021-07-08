import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/functions/getShipperApi.dart';
import 'package:liveasy_admin/services/shipperDataSource.dart';
import 'package:liveasy_admin/widgets/filterButtonWidget.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

class ShipperDetailsScreen extends StatefulWidget {
  const ShipperDetailsScreen({Key? key}) : super(key: key);

  @override
  _ShipperDetailsScreenState createState() => _ShipperDetailsScreenState();
}

class _ShipperDetailsScreenState extends State<ShipperDetailsScreen> {
  double safeBlockVertical = SizeConfig.safeBlockVertical!;
  double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
  ShipperController shipperController = Get.put(ShipperController());

  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: safeBlockVertical * 37),
          Row(children: [
            Text('Shipper details', style: TextStyle(fontSize: size_32)),
            SizedBox(width: safeBlockHorizontal * 727),
            FilterButtonWidget(type: "Shipper")
          ]),
          SizedBox(height: safeBlockVertical * 30),
          Container(
              height: safeBlockVertical * 842,
              width: safeBlockHorizontal * 1137,
              child: Obx(() {
                shipperController.onShipperDeleted.value;
                return FutureBuilder(
                    future: runGetShipperApi(
                        shipperController.choosenShipperFilter.value),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Center(child: Text('Loading'));
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
