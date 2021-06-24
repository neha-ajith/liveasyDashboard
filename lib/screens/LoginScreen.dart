import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/borderWidth.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSize.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/services/authentication.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode textFocusNodeEmail = FocusNode();
  final FocusNode textFocusNodePassword = FocusNode();
  bool _isEditingEmail = false;
  bool keepLoggedIn = false;
  //List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal!;
    double safeBlockVertical = SizeConfig.safeBlockVertical!;

    _buildTextField(String type, TextEditingController controller,
        FocusNode focusNode, String labelText) {
      return Container(
        height: safeBlockVertical * height_71, //71
        width: safeBlockHorizontal * width_449, //449
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(radius_25),
            border: Border.all(color: greyBorderColor.withOpacity(0.30))),
        child: Row(
          children: [
            Container(
              height: safeBlockVertical * height_71, //71
              width: type == "Email"
                  ? safeBlockHorizontal * emailTextbox
                  : safeBlockHorizontal * width_345, //449 or 345
              padding: EdgeInsets.only(
                  left: safeBlockHorizontal * width_31, //31
                  top: safeBlockVertical * height_17, //17
                  bottom: safeBlockVertical * height_17), //17
              child: TextField(
                focusNode: focusNode,
                obscureText: type == "Email" ? false : true,
                keyboardType: type == "Email"
                    ? TextInputType.emailAddress
                    : TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    _isEditingEmail = !_isEditingEmail;
                  });
                },
                onSubmitted: type == "Email"
                    ? (value) {
                        textFocusNodeEmail.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      }
                    : (value) {},
                style: TextStyle(
                    color: black,
                    fontSize: input_size,
                    fontWeight: regularWeight),
                decoration: InputDecoration(
                    hintText: labelText,
                    hintStyle: TextStyle(
                        fontSize: hint_text,
                        fontWeight: regularWeight,
                        color: black.withOpacity(0.30)),
                    border: InputBorder.none),
              ),
            ),
            if (type == "Password")
              TextButton(
                  onPressed: () {},
                  child: Text("Forgot?",
                      style: TextStyle(
                          color: forgotColor,
                          fontWeight: regularWeight,
                          fontSize: forgot)))
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: Column(children: [
            SizedBox(height: safeBlockVertical * height_102), //102
            Container(
              height: safeBlockVertical * height_64p11,
              width: safeBlockHorizontal * width_73,
              child: Image.asset('assets/icons/liveasy_logo.png'),
            ),
            SizedBox(height: safeBlockVertical * height_21p89), //21.89
            Text("Welcome to Liveasy!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'montserrat',
                    color: black,
                    fontSize: size_38,
                    fontWeight: boldWeight)),
            SizedBox(height: safeBlockVertical * height_49), //49
            Container(
              width: safeBlockHorizontal * width_584, //584
              height: safeBlockVertical * height_596, //596
              padding: EdgeInsets.only(
                  top: safeBlockVertical * height_64, //64
                  left: safeBlockHorizontal * width_67, //67
                  right: safeBlockHorizontal * width_68), //68
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                      color: black.withOpacity(0.20), width: borderWidth_10),
                  borderRadius: BorderRadius.circular(radius_30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(
                            color: black,
                            fontSize: size_18,
                            fontWeight: regularWeight),
                        textAlign: TextAlign.left),
                    SizedBox(height: safeBlockVertical * height_10), //10
                    _buildTextField("Email", _emailController,
                        textFocusNodeEmail, 'ex: zivapaul@gmail.com'),
                    SizedBox(height: safeBlockVertical * height_20), //20
                    Text(
                      'Password',
                      style: TextStyle(
                          color: black,
                          fontSize: size_18,
                          fontWeight: regularWeight),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: safeBlockVertical * height_10), //10
                    _buildTextField("Password", _passwordController,
                        textFocusNodePassword, 'ex: Ziva123#'),
                    SizedBox(height: safeBlockVertical * height_20), //20
                    Container(
                      height: safeBlockVertical * height_30, //30
                      padding: EdgeInsets.only(
                          left: safeBlockHorizontal * width_18), //18
                      child: Row(children: [
                        Checkbox(
                            value: keepLoggedIn,
                            onChanged: (bool? value) {
                              setState(() {
                                keepLoggedIn = value!;
                              });
                            }),
                        SizedBox(width: safeBlockHorizontal * width_7),
                        Text('Keep me logged in',
                            style: TextStyle(
                                color: greyTextColor,
                                fontSize: size_18,
                                fontWeight: regularWeight)),
                      ]),
                    ),
                    SizedBox(height: safeBlockVertical * height_20), //20
                    Container(
                      height: safeBlockVertical * height_71,
                      width: safeBlockHorizontal * width_449,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: signInColor),
                              borderRadius: BorderRadius.circular(radius_25)),
                          color: signInColor,
                          onPressed: () {
                            Authentication.signInWithEmail(
                                context: context,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                keepLoggedIn: keepLoggedIn);
                          },
                          child: Text('Sign in',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: white,
                                  fontSize: size_22,
                                  fontWeight: regularWeight))),
                    ),
                    SizedBox(height: safeBlockVertical * height_22),
                    Container(
                      height: safeBlockVertical * height_71,
                      width: safeBlockHorizontal * width_449,
                      child: MaterialButton(
                          onPressed: () {
                            Authentication.signInWithGoogle(
                                context: context, keepLoggedIn: keepLoggedIn);
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: signInColor),
                              borderRadius: BorderRadius.circular(radius_25)),
                          color: white,
                          child: Row(
                            children: [
                              SizedBox(width: safeBlockHorizontal * width_86),
                              Container(
                                height: safeBlockVertical * height_31,
                                width: safeBlockHorizontal * width_31,
                                child:
                                    Image.asset('assets/icons/google_icon.png'),
                              ),
                              SizedBox(width: safeBlockHorizontal * width_8),
                              Text('Sign in using Google',
                                  style: TextStyle(
                                      color: signInColor,
                                      fontSize: size_22,
                                      fontWeight: regularWeight)),
                              SizedBox(height: safeBlockVertical * height_80)
                            ],
                          )),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
