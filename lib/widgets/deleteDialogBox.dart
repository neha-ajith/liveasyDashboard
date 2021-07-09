import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/delShipperApi.dart';
import 'package:liveasy_admin/functions/delTransporterApi.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';

Future<void> deleteDialog(BuildContext context, String userId) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete this User'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Would you like to delete this user?'),
              Text('This action is permenant and cannot be reverted'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Confirm'),
            onPressed: () async {
              if (userId.startsWith("shipper")) {
                await runDeleteShipperApi(userId);
                ShipperController shipperController =
                    Get.find<ShipperController>();
                shipperController.updateOnShipperDelete(true);
              } else {
                await runDeleteTransporterApi(userId);
                TransporterController transporterController =
                    Get.find<TransporterController>();
                transporterController.updateOnTransporterDelete(true);
              }
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
