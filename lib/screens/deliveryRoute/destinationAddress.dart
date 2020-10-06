import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:http/http.dart';
import 'dart:convert';

class destinationAddress extends StatefulWidget {
  @override
  _destinationAddressState createState() => _destinationAddressState();
}

class _destinationAddressState extends State<destinationAddress> {
  @override
  Widget build(BuildContext context) {

    String token;
    double latitudeC;
    double longitudeC;
    List orderData;

    Future getOngoingOrder() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response driverResponse = 
      await get('https://e-pharma-server.herokuapp.com/driver/get/' + decodedToken.claims['id']);
      print(jsonDecode(driverResponse.body)['data']);
      //var response2 = jsonDecode(driverResponse.body)['data'];
      return await jsonDecode(driverResponse.body)['data'];

  }

    return FutureBuilder(
      future: getOngoingOrder(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          print(
              "Location error here"); 
          return Center(
            child: SpinKitChasingDots(color: Colors.cyan[400]),
          );
          
        } else {
          orderData = snapshot.data['data'];
          //print(snapshot.data['lat']);
          latitudeC = snapshot.data['lat'];
          // latitudeC = orderData[0]['lat'];
          longitudeC =  snapshot.data['long'];
          print(snapshot.data);
        }
      }
    );
  }
}
