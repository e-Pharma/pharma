import 'package:flutter/material.dart';
import 'package:epharma/screens/home_screen/home.dart';
import 'package:epharma/screens/login_screen/login.dart';
import 'package:epharma/screens/splash_screen/splash.dart';
import 'package:epharma/screens/my_profile/myProfilePage.dart';
import 'package:epharma/screens/edit_profile/editProfile.dart';
import 'package:epharma/screens/map/map.dart';

class PharmaApp extends StatelessWidget {
  PharmaApp() {
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pharma",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => StartMenu(),
        '/home' : (context) => HomeScreen(),
        '/profile' : (context) => Profile(),
        '/edit' : (context) => EditProfile(),
        '/map' : (context) => Map(),
      },
    );
  }
}
