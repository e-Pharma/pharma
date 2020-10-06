import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:epharma/screens/deliveryRoute/deliveryRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:epharma/screens/map/map.dart';
import 'package:flutter_map/flutter_map.dart';

class OngoingOrders extends StatefulWidget {
  @override
  _OngoingOrdersState createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  String token;
  List orderData;

  String id;
  String name;
  String clientId;
  String delivery_address;
  String email;
  String patient;
  String contact;
  String nic;
  String ordered_at;
  String delivery_charges;
  int full_amount;
  String prescription_url;

  double latitude ;
  double longitude;

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
    return Scaffold(
      body: FutureBuilder(
        future: this.getOngoingOrder(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            print("ongoing order error..");

            return Center(
              child: SpinKitChasingDots(color: Colors.cyan[400]),
            );
          } else {
            print('*******');
            print("data came to the front end");

            orderData = snapshot.data;

            return ListView.builder(
              itemCount: orderData.length,
              itemBuilder: (BuildContext context, int index) {
                name = orderData[index]['name'];
                contact = orderData[index]['contact'];
                return Container(
                  child: ListTile(
                    title: Text(orderData[index]['name']),
                    subtitle: Text(orderData[index]['delivery_address']),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      _popupDialog(orderData[index]);
                      //name = orderData[index]['name'];
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  _popupDialog(orderData) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          print('inside showdialog');

          name = orderData['name'];
          delivery_address = orderData['delivery_address'];
          contact = orderData['contact'];
          nic = orderData['nic'];
          full_amount = orderData['full_amount'];
          String order_id = orderData["_id"];

          latitude = orderData["lat"];
          longitude = orderData["long"];

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Center(child: Text("Order Details")),
            content: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Name",
                    ),
                    initialValue: name,
                    enabled: false,
                  ),
                ),
                Container(
                  child: TextFormField(
                    //expands: true,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.room),
                      labelText: "Delivery Address",
                    ),
                    initialValue: delivery_address,
                    enabled: false,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: "Contact",
                    ),
                    initialValue: contact,
                    enabled: false,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.chrome_reader_mode),
                      labelText: "NIC",
                    ),
                    initialValue: nic,
                    enabled: false,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.attach_money),
                      labelText: "Full Amount",
                    ),
                    initialValue: full_amount.toString(),
                    enabled: false,
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.attach_money),
                      labelText: "Location - TEST",
                    ),
                    initialValue: latitude.toString(),
                    enabled: false,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapView()),
                        );
                      },
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'START NAVIGATE',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 8,
              )
            ],
          );
        });
  }
}
