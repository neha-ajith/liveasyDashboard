import 'package:flutter/material.dart';
import 'package:liveasy_admin/functions/delShipperApi.dart';

Future<void> showMyDialog(BuildContext context, String id) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm'),
        content: Column(
          children: <Widget>[
            Text('Are you sure you want to delete?'),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Confirm'),
            onPressed: () async {
              String status;
              status = await runDeleteShipperApi(id);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$status')));
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
