import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:http/http.dart';
import 'dart:convert';


void main() => runApp(Map());

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  GoogleMapController mapController;
  final LatLng _center = const LatLng(6.9271, 79.8612);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'images/location.png').then((onValue) {
        pinLocationIcon = onValue;
      });
  }

  String token;

  double latitude;
  double longitude;

  Map orderData; //Map?  List?

  Future getOngoingOrder() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response =
        await get("https://e-pharma-server.herokuapp.com/driver/ongoingOrders");
    return jsonDecode(response.body)['data'];
  }


  @override
  Widget build(BuildContext context) {

    body: FutureBuilder(
      future: this.getOngoingOrder(),
      builder: (context, snapshot) {
        if(snapshot.data == null) {
          print("Location error");
        } 
        else{
          orderData = snapshot.data;
          return Container(
            latitude = orderData['lat'];
            longitude = orderData['long'];

            LatLng pinPosition = LatLng(latitude, longitude);

            CameraPosition initialLocation = CameraPosition(
      target: pinPosition,
      zoom: 16,
      bearing: 30
    );

    return GoogleMap(
      myLocationButtonEnabled: true,
      markers: _markers,
      initialCameraPosition: initialLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);

        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId('<MARKER_ID>'),
              position: pinPosition,
              icon: pinLocationIcon
              )
          )
        });
      },
      
      );
          );
          
        }
      },
    );

    

    

    
    // return Scaffold(
    //   appBar: new AppBar(
    //     title: const Text(
    //       'Map',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 30.0,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ),
    //     backgroundColor: Colors.cyan[200],
    //   ),
    //   body: FutureBuilder(
    //     future: getOngoingOrder(),
    //     builder: (context, snapshot) {
    //       if (snapshot.data == null) {
    //         print("ongoing order error..");
    //       } else {
    //         orderData = snapshot.data;
    //         //1
    //         return GoogleMap(
              
    //           onMapCreated: _onMapCreated,
    //           //which part of the world you want the map to point at
    //           //2
    //           initialCameraPosition: CameraPosition(
    //             target: _center,
    //             zoom: 11.0,
    //           )
    //           // latitude = orderData["lat"];
    //           // longitude = orderData["long"];
    //         );
    //       }
    //     },

    //   ),
    // );
  }
}
