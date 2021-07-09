import 'package:flutter/material.dart';

Future<void> dialogBox(BuildContext context, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
              child: Column(children: [
            Text(content),
            Text("Please make appropriate changes")
          ])),
          actions: <Widget>[
            TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ]);
    },
  );
}
