import 'package:flutter/material.dart';
import 'package:liveasy_admin/services/authentication.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';

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
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
    double safeBlockVertical = SizeConfig.safeBlockVertical!;

    _buildTextField(String type, TextEditingController controller,
        FocusNode focusNode, String labelText) {
      return Container(
          height: safeBlockVertical * 71,
          width: safeBlockHorizontal * 449,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(radius_25),
              border: Border.all(color: greyColor.withOpacity(0.30))),
          child: Row(children: [
            FittedBox(
                fit: BoxFit.cover,
                child: Container(
                    height: safeBlockVertical * 71,
                    width: type == "Password"
                        ? safeBlockHorizontal * 345
                        : safeBlockHorizontal * 449,
                    padding: EdgeInsets.only(
                        left: safeBlockHorizontal * 42,
                        top: safeBlockVertical * 22,
                        bottom: safeBlockVertical * 22),
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
                        onSubmitted: type == "Email"
                            ? (value) {
                                textFocusNodeEmail.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(textFocusNodePassword);
                              }
                            : (value) {
                                textFocusNodePassword.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(buttonFocusNodesignIn);
                              },
                        style:
                            TextStyle(color: black, fontWeight: normalWeight),
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
                      height: safeBlockVertical * 22,
                      width: safeBlockHorizontal * 71,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text("Forgot?",
                              style: TextStyle(
                                  color: forgotColor,
                                  fontWeight: normalWeight,
                                  fontSize: 18)))))
          ]));
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: white,
            body: Center(
                child: Column(children: [
              SizedBox(height: safeBlockVertical * 100),
              Container(
                  height: safeBlockVertical * 90,
                  width: safeBlockHorizontal * 90,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('icons/liveasy_logo.png',
                          height: safeBlockVertical * 69.09,
                          width: safeBlockHorizontal * 71))),
              SizedBox(height: safeBlockVertical * 30),
              Container(
                  height: safeBlockVertical * 46,
                  width: safeBlockHorizontal * 408,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text("Welcome to Liveasy!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: black,
                              fontSize: 38,
                              fontWeight: boldWeight)))),
              SizedBox(height: safeBlockVertical * 50),
              Container(
                  height: safeBlockVertical * 520,
                  width: safeBlockHorizontal * 585,
                  padding: EdgeInsets.only(
                      top: safeBlockVertical * 64,
                      left: safeBlockHorizontal * 67,
                      right: safeBlockHorizontal * 68),
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(
                          color: black.withOpacity(0.20), width: borderWidth_1),
                      borderRadius: BorderRadius.circular(radius_30)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: safeBlockVertical * 22,
                            width: safeBlockHorizontal * 52,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Email',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: normalWeight)))),
                        SizedBox(height: safeBlockVertical * 20),
                        AutofillGroup(
                          child: _buildTextField("Email", _emailController,
                              textFocusNodeEmail, 'ex: zivapaul@gmail.com'),
                        ),
                        SizedBox(height: safeBlockVertical * 30),
                        Container(
                            height: safeBlockVertical * 22,
                            width: safeBlockHorizontal * 87,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Password',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: regularWeight)))),
                        SizedBox(height: safeBlockVertical * 20),
                        _buildTextField("Password", _passwordController,
                            textFocusNodePassword, 'ex: Ziva123#'),
                        SizedBox(height: safeBlockVertical * 50),
                        Container(
                          height: safeBlockVertical * 71,
                          width: safeBlockHorizontal * 449,
                          child: MaterialButton(
                              focusNode: buttonFocusNodesignIn,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: signInColor),
                                  borderRadius:
                                      BorderRadius.circular(radius_25)),
                              color: signInColor,
                              onPressed: () {
                                Authentication.signInWithEmail(
                                    context: context,
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim());
                              },
                              child: Container(
                                height: safeBlockVertical * 24.5,
                                width: safeBlockHorizontal * 85,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text('Sign in',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: white,
                                          fontSize: 22,
                                          fontWeight: regularWeight)),
                                ),
                              )),
                        )
                      ]))
            ]))));
  }
}
