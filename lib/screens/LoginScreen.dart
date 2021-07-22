import 'package:flutter/material.dart';
import 'package:liveasy_admin/services/authentication.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/widgets/loginScreenTextFields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode textFocusNodeEmail = FocusNode();
  final FocusNode textFocusNodePassword = FocusNode();
  final FocusNode buttonFocusNodesignIn = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.mediaQueryData == null) {
      SizeConfig().init(context);
    }
    double height = SizeConfig.safeBlockVertical!;
    double width = SizeConfig.safeBlockHorizontal!;

    return SafeArea(
        child: Scaffold(
            backgroundColor: white,
            body: Center(
                child: Column(children: [
              SizedBox(height: height * 100),
              Container(
                  height: height * 90,
                  width: width * 90,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('icons/liveasy_logo.png',
                          height: height * 69.09, width: width * 71))),
              SizedBox(height: height * 30),
              Container(
                  height: height * 46,
                  width: width * 408,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text("Welcome to Liveasy!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: black,
                              fontSize: 38,
                              fontWeight: boldWeight)))),
              SizedBox(height: height * 50),
              Container(
                  height: height * 580,
                  width: width * 585,
                  padding: EdgeInsets.only(
                      top: height * 64, left: width * 67, right: width * 68),
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(
                          color: black.withOpacity(0.20), width: borderWidth_1),
                      borderRadius: BorderRadius.circular(radius_30)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 22,
                            width: width * 52,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Email',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: normalWeight)))),
                        SizedBox(height: height * 20),
                        AutofillGroup(
                            child: BuildTextField(
                                type: "Email",
                                controller: _emailController,
                                focusNode: textFocusNodeEmail,
                                nextFocusNode: textFocusNodePassword,
                                labelText: 'ex: zivapaul@gmail.com',
                                context: context)),
                        SizedBox(height: height * 30),
                        Container(
                            height: height * 22,
                            width: width * 87,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Password',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: regularWeight)))),
                        SizedBox(height: height * 30),
                        AutofillGroup(
                            child: BuildTextField(
                                type: "Password",
                                controller: _passwordController,
                                focusNode: textFocusNodePassword,
                                nextFocusNode: buttonFocusNodesignIn,
                                labelText: 'ex: Ziva123#',
                                context: context)),
                        SizedBox(height: height * 40),
                        Container(
                            height: height * 71,
                            width: width * 449,
                            child: TextButton(
                                focusNode: buttonFocusNodesignIn,
                                style: TextButton.styleFrom(
                                    backgroundColor: signInColor,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: signInColor),
                                        borderRadius:
                                            BorderRadius.circular(radius_25))),
                                onPressed: () {
                                  Authentication.signInWithEmail(
                                      context: context,
                                      email: _emailController.text.trim(),
                                      password:
                                          _passwordController.text.trim());
                                },
                                child: Container(
                                    height: height * 24.5,
                                    width: width * 85,
                                    child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Text('Sign in',
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: white,
                                                fontSize: 22,
                                                fontWeight: regularWeight))))))
                      ]))
            ]))));
  }
}
