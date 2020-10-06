import 'package:flutter/material.dart';
import 'package:epharma/screens/home_screen/home.dart';
import 'package:epharma/screens/login_screen/login.dart';
import 'package:epharma/screens/splash_screen/splash.dart';
import 'package:epharma/screens/drawer/my_profile/myProfilePage.dart';
import 'package:epharma/screens/drawer/edit_profile/editProfile.dart';
import 'package:epharma/screens/drawer/notification/notification.dart';
import 'package:epharma/screens/drawer/share_location/share_location.dart';
import 'package:epharma/screens/map/map.dart';
import 'package:epharma/screens/drawer/share_location/currentlocation.dart';
import 'package:epharma/screens/deliveryRoute/deliveryRoute.dart';
<<<<<<< Updated upstream
// import 'package:epharma/screens/deliveryRoute/destinationAddress';
=======
import 'package:epharma/screens/map/mapNew.dart';
>>>>>>> Stashed changes

class PharmaApp extends StatelessWidget {
  PharmaApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pharma",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => StartMenu(),
        '/home' : (context) => HomeScreen(),
        '/profile' : (context) => Profile(),
        '/edit' : (context) => EditProfile(),
        '/notification' : (context) => Notification_Tab(),
        // '/map' : (context) => Map(),
        '/location' : (context) => ShareLocation(),
        '/currentlocation' : (context) => CurrentLocation(),
        '/delRoute' : (context) => DeliveryRoute(),
<<<<<<< Updated upstream

=======
        '/mapNew' : (context) => MapNew(),
>>>>>>> Stashed changes
 
      },
    );
  }
}
