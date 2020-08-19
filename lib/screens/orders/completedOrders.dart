import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  String token;
  List completedOrderData;

  String id;
  String name;
  String clientId;
  // ignore: non_constant_identifier_names
  String delivery_address;
  String email;
  String patient;
  String contact;
  String nic;
  // ignore: non_constant_identifier_names
  String ordered_at;
  // ignore: non_constant_identifier_names
  String delivery_charges;
  // ignore: non_constant_identifier_names
  int full_amount;
  // ignore: non_constant_identifier_names
  String prescription_url;

  Future getPendingOrder() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response = await get(
        "https://e-pharma-server.herokuapp.com/driver/completedOrders");
    return jsonDecode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.getPendingOrder(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              print("Loading completed order data ..");

              return Center(
                child: SpinKitChasingDots(color: Colors.cyan[400]),
              );
            } else {
              print("Order details came to the front end");
              completedOrderData = snapshot.data;

              return ListView.builder(
                  itemCount: completedOrderData.length,
                  itemBuilder: (BuildContext context, int index) {
                    name = completedOrderData[index]['name'];
                    contact = completedOrderData[index]['contact'];
                    return Container(
                      child: ListTile(
                        title: Text(completedOrderData[index]['name']),
                        subtitle:
                            Text(completedOrderData[index]['delivery_address']),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          _popupDialog(completedOrderData[index]);
                        },
                      ),
                    );
                  });
            }
          }),
    );
  }

  _popupDialog(completedOrderData) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          name = completedOrderData['name'];
          delivery_address = completedOrderData['delivery_address'];
          contact = completedOrderData['contact'];
          nic = completedOrderData['nic'];
          full_amount = completedOrderData['full_amount'];
          delivery_charges = completedOrderData['delivery_charges'];
          prescription_url = completedOrderData['prescription_url'];

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
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.attach_money, size: 12.0,),
                            labelText: "Full Amount",
                          ),
                          initialValue: full_amount.toString(),
                          enabled: false,
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.attach_money, size: 12.0,),
                            labelText: "Delivery Charges",
                          ),
                          initialValue: delivery_charges.toString(),
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        //  borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: new NetworkImage(prescription_url),
                            fit: BoxFit.fill)),
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.access_time),
                      labelText: "Delivered at",
                    ),
                    initialValue: "",
                    enabled: false,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
