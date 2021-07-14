import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';

// ignore: must_be_immutable
class UpdateScreenTextField extends StatefulWidget {
  String labelText;
  TextEditingController controller;
  bool editable;
  FocusNode? focusNode;
  UpdateScreenTextField(
      {required this.labelText,
      required this.controller,
      required this.editable,
      this.focusNode});

  @override
  _UpdateScreenTextFieldState createState() => _UpdateScreenTextFieldState();
}

class _UpdateScreenTextFieldState extends State<UpdateScreenTextField> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 50,
        width: width * 220,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: greyColor.withOpacity(0.80))),
        child: Row(children: [
          Container(
              height: height * 40,
              width: widget.labelText == "Contact" ? width * 215 : width * 175,
              padding: EdgeInsets.only(
                  left: width * 20, top: height * 8, bottom: height * 8),
              child: TextField(
                  focusNode: widget.focusNode,
                  onSubmitted: (value) {
                    widget.focusNode!.unfocus();
                  },
                  enabled: widget.editable,
                  textInputAction: TextInputAction.next,
                  controller: widget.controller,
                  style: TextStyle(
                      color: black, fontSize: 12, fontWeight: normalWeight),
                  decoration: InputDecoration(
                      hintText: widget.controller.text == ""
                          ? widget.labelText
                          : null,
                      hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: regularWeight,
                          color: black),
                      border: InputBorder.none))),
          if (widget.labelText != "Contact")
            Container(
                height: height * 14,
                width: width * 14,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: IconButton(
                        icon: Image.asset('icons/edit.png'),
                        onPressed: () {
                          setState(() {
                            widget.editable = true;
                          });
                        })))
        ]));
  }
}
