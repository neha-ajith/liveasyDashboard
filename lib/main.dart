import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
//import 'package:flutter_config/flutter_config.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';
import 'package:liveasy_admin/screens/dashboardScreen.dart';
import 'package:liveasy_admin/services/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(LiveasyAdmin());
}

class LiveasyAdmin extends StatefulWidget {
  @override
  _LiveasyAdminState createState() => _LiveasyAdminState();
}

class _LiveasyAdminState extends State<LiveasyAdmin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Authentication.getUser(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return GetMaterialApp(
                title: "Liveasy Admin",
                theme: ThemeData(fontFamily: 'montserrat'),
                home: Dashboard(userData: Authentication.userData));
          } else {
            return GetMaterialApp(
              title: "Liveasy Admin",
              theme: ThemeData(fontFamily: 'montserrat'),
              home: LoginScreen(),
            );
          }
        });
  }
}
