import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/services/authentication.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';
import 'package:liveasy_admin/screens/homeScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await dotenv.load(fileName: ".env");
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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GetMaterialApp(
                title: "Liveasy Admin",
                theme: ThemeData(fontFamily: 'montserrat'),
                home: HomeScreen(userData: snapshot.data));
          } else {
            return GetMaterialApp(
                title: "Liveasy Admin",
                theme: ThemeData(fontFamily: 'montserrat'),
                home: LoginScreen());
          }
        });
  }
}
