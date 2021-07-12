import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

buildTextField(
    String type,
    TextEditingController controller,
    FocusNode focusNode,
    FocusNode nextFocusNode,
    String labelText,
    BuildContext context) {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  return Container(
      height: height * 71,
      width: width * 449,
      decoration: BoxDecoration(
          color: white,
          border: Border.all(color: greyColor.withOpacity(0.30)),
          borderRadius: BorderRadius.circular(radius_25)),
      child: Row(children: [
        FittedBox(
            fit: BoxFit.cover,
            child: Container(
                height: height * 71,
                width: type == "Password" ? width * 345 : width * 449,
                padding: EdgeInsets.only(
                    left: width * 42, top: height * 22, bottom: height * 22),
                child: TextField(
                    autofillHints: type == 'Email'
                        ? [AutofillHints.email]
                        : [AutofillHints.password],
                    focusNode: focusNode,
                    obscureText: type == "Email" ? false : true,
                    keyboardType: type == "Email"
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller,
                    onSubmitted: (value) {
                      focusNode.unfocus();
                      FocusScope.of(context).requestFocus(nextFocusNode);
                    },
                    style: TextStyle(color: black, fontWeight: normalWeight),
                    decoration: InputDecoration(
                      hintText: labelText,
                      hintStyle: TextStyle(
                          fontWeight: regularWeight,
                          color: black.withOpacity(0.30)),
                      border: InputBorder.none,
                    )))),
        if (type == "Password")
          TextButton(
              onPressed: () {}, //Forgot Password Logic
              child: Container(
                  height: height * 22,
                  width: width * 71,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text("Forgot?",
                          style: TextStyle(
                              color: forgotColor,
                              fontWeight: normalWeight,
                              fontSize: 18)))))
      ]));
}
