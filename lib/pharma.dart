import 'package:flutter/material.dart';
import 'package:pharma/screens/home_screen/home.dart';
import 'package:pharma/screens/login_screen/login.dart';
import 'package:pharma/screens/splash_screen/splash.dart';
import 'package:pharma/screens/my_profile/myProfilePage.dart';
import 'package:pharma/screens/edit_profile/editProfile.dart';

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
      },
    );
  }
}
