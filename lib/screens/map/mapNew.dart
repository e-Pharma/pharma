import 'dart:async';
import 'package:epharma/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MapNew());

class MapNew extends StatefulWidget {
  @override
  _MapNewState createState() => _MapNewState();
}

class _MapNewState extends State<MapNew> {
  String token;

  double latitudeC;
  double longitudeC;
  double latitudeD;
  double longitudeD;

  List orderData;
  List driverData;

  //-------------------------------------------------------------------------------------
  //get client location
  Future getOngoingOrder() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });

    var decodedToken = new JWT.parse(token);

    Response clientResponse =
        await get("https://e-pharma-server.herokuapp.com/driver/ongoingOrders");
    //var response1 = jsonDecode(clientResponse.body)['data'];
    return await jsonDecode(clientResponse.body)['data'];
    
  }

  //get driver location
  Future getDriverData() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("key");
    });

    var decodedToken = new JWT.parse(token);

    Response driverResponse = await get(
        'https://e-pharma-server.herokuapp.com/driver/get/' +
            decodedToken.claims['id']);
    //var response2 = jsonDecode(driverResponse.body)['data'];
    return await jsonDecode(driverResponse.body)['data'];
  }

  //--------------------------------------------------------------------------------------

  final Set<Polyline> polyline = {};
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: 'AIzaSyBBk823l5LTEiRQUCJyTa9WLW8C1psVRTE');
  GoogleMapController _controller;

  getPoints() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);

    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(6.91, 79.85),
          destination: LatLng(6.858966, 79.865483),
          mode: RouteMode.driving);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        polylines: polyline,
        initialCameraPosition:
            CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 14.0),
        mapType: MapType.normal,
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      polyline.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: Colors.red,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }
}
