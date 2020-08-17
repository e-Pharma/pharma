import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class OngoingOrders extends StatefulWidget {
  @override
  _OngoingOrdersState createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {

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
  String full_amount;
  String prescription_url;

  Future getOngoingOrder() async {
    await SharedPreferences.getInstance().then((prefs){
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
          if(snapshot.data == null){
            print("ongoing order error..");

            return Center(
              child: SpinKitChasingDots(color: Colors.cyan[400]),
              
            );
            

          } else {
            print('*******');
            print("data came to the fornt end");

            orderData = snapshot.data;
            name = orderData[0]['name'];
            delivery_address = orderData[0]['delivery_address'];

            return ListView.builder(
              itemCount: orderData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    title: Text(orderData[index]['name']),
                    subtitle: Text(orderData[index]['delivery_address']),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
