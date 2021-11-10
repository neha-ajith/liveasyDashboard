import 'package:flutter/material.dart';
import 'package:liveasy_admin/widgets/dialogBox.dart';

Future dialogBox(BuildContext context, String title, String description,
    String? userId, String? type) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogBox(
            title: title, description: description, userId: userId, type: type);
      });
}
