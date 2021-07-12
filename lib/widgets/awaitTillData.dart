import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AwaitData extends StatelessWidget {
  var data;
  AwaitData({required data});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
