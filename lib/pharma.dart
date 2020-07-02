import 'package:flutter/material.dart';
import 'package:epharma/screens/login_screen/login.dart';
import 'package:epharma/screens/splash_screen/splash.dart';

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
      },
    );
  }
}
