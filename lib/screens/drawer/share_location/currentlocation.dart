import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation extends StatefulWidget {

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  GoogleMapController mapController;

//  final LatLng _center = const LatLng(6.9271, 79.8612);
  Position _currentPosition;
  List<Marker> allMarkers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
      super.initState();
      _getCurrentLocation();
      allMarkers.add(Marker(
          markerId: MarkerId('myMarker'),
          draggable: false,
          onTap: (){
            print('Marker Tapped');
          },
          position: LatLng(6.0315, 80.2335)
      ));


  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return new Scaffold(
      body: GoogleMap(
              onMapCreated: _onMapCreated,
//        mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng( _currentPosition.latitude , _currentPosition.longitude),
                zoom: 10.0,
              ),
              markers: Set.from(allMarkers),
            ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
//      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

//  _getAddressFromLatLng() async {
//    try {
//      List<Placemark> p = await geolocator.placemarkFromCoordinates(
//          _currentPosition.latitude, _currentPosition.longitude);
//
//      Placemark place = p[0];
//
//      setState(() {
//        _currentAddress =
//        "${place.locality}, ${place.postalCode}, ${place.country}";
//      });
//    } catch (e) {
//      print(e);
//    }
//  }

//  void _getLocation() async {
//    var currentLocation = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//
//    setState(() {
//      _markers.clear();
//      final marker = Marker(
//        markerId: MarkerId("curr_loc"),
//        position: LatLng(currentLocation.latitude, currentLocation.longitude),
//        infoWindow: InfoWindow(title: 'Your Location'),
//      );
//      _markers["Current Location"] = marker;
//    });
//  }

}
