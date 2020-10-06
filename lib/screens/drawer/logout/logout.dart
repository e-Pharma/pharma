import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';



class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  String token;
  Map driverData;

  //retrieve driver data
  Future getData() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response = await get(
        'https://e-pharma-server.herokuapp.com/driver/get/' +
            decodedToken.claims['id']);
    print(response.body);
    // setState(() {
    //   driverData=jsonDecode(response.body)['data'];
    // });
    return jsonDecode(response.body)["data"];
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.cyan[200],
      ),
      body: FutureBuilder(
        builder: null),
    );
  }
}