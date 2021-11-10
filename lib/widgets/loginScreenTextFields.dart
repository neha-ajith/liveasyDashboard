import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

// ignore: must_be_immutable
class BuildTextField extends StatefulWidget {
  String type, labelText;
  TextEditingController controller;
  FocusNode focusNode, nextFocusNode;
  BuildContext context;
  BuildTextField(
      {required this.type,
      required this.controller,
      required this.focusNode,
      required this.nextFocusNode,
      required this.labelText,
      required this.context});

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
          height: height * 71,
          width: width * 449,
          decoration: BoxDecoration(
              color: white,
              border: Border.all(color: greyColor.withOpacity(0.30)),
              borderRadius: BorderRadius.circular(radius_3+1)),
          child: Row(children: [
            FittedBox(
                fit: BoxFit.cover,
                child: Container(
                    height: height * 71,
                    width:
                        widget.type == "Password" ? width * 400 : width * 449,
                    padding: EdgeInsets.only(
                        left: width * 42,
                        top: height * 22,
                        bottom: height * 22),
                    child: TextField(
                        autofillHints: widget.type == 'Email'
                            ? [AutofillHints.email]
                            : [AutofillHints.password],
                        focusNode: widget.focusNode,
                        obscureText:
                            widget.type == "Email" ? false : !isVisible,
                        keyboardType: widget.type == "Email"
                            ? TextInputType.emailAddress
                            : TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: widget.controller,
                        onSubmitted: (value) {
                          widget.focusNode.unfocus();
                          FocusScope.of(context)
                              .requestFocus(widget.nextFocusNode);
                        },
                        style:
                            TextStyle(color: black, fontWeight: normalWeight),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.labelText,
                          hintStyle: TextStyle(
                              fontWeight: regularWeight,
                              color: black.withOpacity(0.30)),
                        )))),
            if (widget.type == "Password")
              IconButton(
                  focusColor: blue,
                  color: black,
                  icon: isVisible
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  })
          ])),
      if (widget.type == "Password") SizedBox(height: height * 10),
      if (widget.type == "Password")
        TextButton(
            onPressed: () {},
            child: Container(
                height: height * 42,
                width: width * 150,
                child: FittedBox(
                    child: Text('Forgot Password ?',
                        style: TextStyle(color: forgotColor, fontSize: 18)))))
    ]);
  }
}
