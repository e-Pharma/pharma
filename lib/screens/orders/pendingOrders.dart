import 'package:epharma/screens/drawer/my_profile/myProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PendingOrders extends StatefulWidget {
  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
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

  

  Future getPendingOrder() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response =
        await get("https://e-pharma-server.herokuapp.com/driver/pendingOrders");
    //print("--------------------------");
    //print(response.body);
    return jsonDecode(response.body)['data'];
  }

  updateOrderStatus(String orderid,BuildContext cont) async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);
    String status = 'dispatched';
    Response response = await post(
      "https://e-pharma-server.herokuapp.com/driver/updateOrderStatus/" +
          orderid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
      }),
    );

    //print("--------------------------");
    //print(response.body);
    Navigator.of(cont).pop();
    if (response.statusCode == 202) {
      //print("object");
      //Navigator.pop(context);
      
      return showDialog(
        context: context ,
        builder: (context) {
            return AlertDialog(
               shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          content: Text(
            "You have an Ongoing Order!",
            style: TextStyle(
              color: Colors.cyan[400],
              fontSize: 20.0,
            ),
          ),
        );
        }
      
      );
    } else {
    return showDialog(
        context: context ,
        builder: (context) {
            return AlertDialog(
               shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          content: Text("fail"),
        );
        }
      
      );
    }
  }

  retrieveLocation(String orderid, BuildContext cont) async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response = await post(
      "https://e-pharma-server.herokuapp.com/driver/pendingOrders/" +
          orderid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.getPendingOrder(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              print("Pending order error ..");

              return Center(
                child: SpinKitChasingDots(color: Colors.cyan[400]),
              );
            } else {
              print('----------------------------------------');
              print("Pending Order data came to the front end");
              // print(snapshot.data[0]);
              orderData = snapshot.data;
              // name = orderData[0]['name'];
              // delivery_address = orderData[0]['delivery_address'];
              // contact = orderData[0]['contact'];
              // nic = orderData[0]['nic'];
              // full_amount = orderData[0]['full_amount'];

              return ListView.builder(
                  // shrinkWrap: true,
                  // itemCount: orderData.length,
                  itemCount: orderData.length,
                  itemBuilder: (BuildContext context, int index) {
                    name = orderData[index]['patient'];
                    contact = orderData[index]['contact'];
                    
                    return Container(
                      // height: 450,
                      child: ListTile(
                        title: Text(orderData[index]['patient']),
                        subtitle: Text(orderData[index]['delivery_address']),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          _popupDialog(orderData[index]);
                          //name = orderData[index]['name'];
                        },
                      ),
                    );
                  });
            }
          }),
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
          patient = orderData['patient'];
          

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
                    initialValue: patient,
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
                      color: Colors.cyan[400],
                      onPressed: () {
                        updateOrderStatus(order_id,context);
                      },
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'ACCEPT',
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
