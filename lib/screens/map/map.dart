// import 'dart:async';
// import 'package:epharma/services/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:corsac_jwt/corsac_jwt.dart';
// import 'package:http/http.dart';
// import 'dart:convert';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

// void main() => runApp(Map());

// class Map extends StatefulWidget {
//   @override
//   _MapState createState() => _MapState();
// }

// class _MapState extends State<Map> {

//   GoogleMapController mapController;
//   final LatLng _center = const LatLng(6.9271, 79.8612);

//   //Polyline
//   final Set<Polyline> polyline = {};
//   List<LatLng> routeCoords;
//   GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(apiKey: "");

  
//   //google map controller
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   //Pin
//   BitmapDescriptor pinLocationIcon;
//   Set<Marker> _markers = {};
//   Completer<GoogleMapController> _controller = Completer();

//   //get an png image as the pin
//   @override
//   void initState() {
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration(devicePixelRatio: 2.5), 'images/location.png')
//         .then((onValue) {
//       pinLocationIcon = onValue;
//     });
//   }

//   String token;

//   double latitudeC;
//   double longitudeC;
//   double latitudeD;
//   double longitudeD;

//   List orderData;
//   // Map orderData;
//   List driverData; //Map?  List?

//   //get client location and driver location
//   Future getOngoingOrder() async {
//     await SharedPreferences.getInstance().then((prefs) {
//       token = prefs.getString("token");
//     });
//     var decodedToken = new JWT.parse(token);
//     print(decodedToken.claims['id']);

//     // Response clientResponse =
//     //   await get("https://e-pharma-server.herokuapp.com/driver/ongoingOrders");
//     //   var response1 = jsonDecode(clientResponse.body)['data'];
//       //return jsonDecode(clientResponse.body)['data'];

//     Response driverResponse = 
//       await get('https://e-pharma-server.herokuapp.com/driver/get/' + decodedToken.claims['id']);
//       print(jsonDecode(driverResponse.body)['data']);
//       //var response2 = jsonDecode(driverResponse.body)['data'];
//       return await jsonDecode(driverResponse.body)['data'];

//     // List<Future> responseList = [response1,response2];
//     // return responseList;

//     //     print(response1);
//     //     print('*****************************');
//     //     print(response2);bab
//   }

//   //draw polyline 
//   getPoints(double clat, double clong,double dlat, double dlong) async {
//     routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
//       origin: LatLng(dlat, dlong), 
//       destination: LatLng(6.858966, 79.865483),
//       mode: RouteMode.driving,
//     );
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getPoints(clat, clong, dlat, dlong)
//   // }



//   //get driver location
//   // Future getDriverData() async {
//   //   await SharedPreferences.getInstance().then((prefs) {
//   //     token = prefs.getString("key");
//   //   });
//   //   var decodedToken = new JWT.parse(token);

//   //   Response driverResponse = 
//   //     await get(
//   //       'https://e-pharma-server.herokuapp.com/driver/get/' +
//   //           decodedToken.claims['id']);
      
//   //     return jsonDecode(driverResponse.body)['data'];
//   // }

  
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getOngoingOrder(),
//       builder: (context, snapshot) {
//         if (snapshot.data == null) {
//           print(
//               "Location error here"); 
//           return Center(
//             child: SpinKitChasingDots(color: Colors.cyan[400]),
//           );
          
//         } else {
//           orderData = snapshot.data['data'];
//           // //driverData = snapshot.data[1];
//           // //client location - lat and long
//           //print(snapshot.data['lat']);
//           latitudeC = snapshot.data['lat'];
//           // latitudeC = orderData[0]['lat'];
//           longitudeC =  snapshot.data['long'];

//           // latitudeD = driverData[1]['lat'];
//           // longitudeD = driverData[1]['long'];
          
//           print(snapshot.data);
//           //pin the location on map
//           LatLng pinPosition1 = LatLng(latitudeC, longitudeC);
//           //LatLng pinPosition2 = LatLng(latitudeD, longitudeD);
//           //camera position
//           CameraPosition initialLocation =
//               CameraPosition(target: pinPosition1, zoom: 15, bearing: 30);
//           // print(orderData);
//           //google map
//           return Container(
//               child: GoogleMap(
//             myLocationButtonEnabled: true,
//             markers: _markers,
//             initialCameraPosition: initialLocation,
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);

//               setState(() {
//                 _markers.add(Marker(
//                     markerId: MarkerId('<MARKER_ID>'),
//                     position: pinPosition1,
//                     icon: pinLocationIcon));
//               });
//             },
//           ));
//         }
//       },
//     );

//     // return Scaffold(
//     //   appBar: new AppBar(
//     //     title: const Text(
//     //       'Map',
//     //       style: TextStyle(
//     //         color: Colors.white,
//     //         fontSize: 30.0,
//     //         fontWeight: FontWeight.w500,
//     //       ),
//     //     ),
//     //     backgroundColor: Colors.cyan[200],
//     //   ),
//     //   body: FutureBuilder(
//     //     future: getOngoingOrder(),
//     //     builder: (context, snapshot) {
//     //       if (snapshot.data == null) {
//     //         print("ongoing order error..");
//     //       } else {
//     //         orderData = snapshot.data;
//     //         //1
//     //         return GoogleMap(

//     //           onMapCreated: _onMapCreated,
//     //           //which part of the world you want the map to point at
//     //           //2
//     //           initialCameraPosition: CameraPosition(
//     //             target: _center,
//     //             zoom: 11.0,
//     //           )
//     //           // latitude = orderData["lat"];
//     //           // longitude = orderData["long"];
//     //         );
//     //       }
//     //     },

//     //   ),
//     // );
//   }
// }
