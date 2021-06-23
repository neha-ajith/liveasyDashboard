import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/screens/LoginScreen.dart';
import 'package:liveasy_admin/screens/dashboardScreen.dart';
import 'package:liveasy_admin/screens/errorScreen.dart';
import 'package:liveasy_admin/services/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(LiveasyAdmin());
}

class LiveasyAdmin extends StatefulWidget {
  const LiveasyAdmin({Key? key}) : super(key: key);

  @override
  _LiveasyAdminState createState() => _LiveasyAdminState();
}

class _LiveasyAdminState extends State<LiveasyAdmin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Authentication.getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == "Pass") {
              return GetMaterialApp(
                title: "Liveasy Admin",
                theme: ThemeData(fontFamily: 'montserrat'),
                home: LoginScreen(),
              );
            } else {
              return GetMaterialApp(
                title: "Liveasy Admin",
                theme: ThemeData(fontFamily: 'montserrat'),
                home: Dashboard(userData: Authentication.userData),
              );
            }
          } else {
            return ErrorScreen();
          }
        });
  }
}
