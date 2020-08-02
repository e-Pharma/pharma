import 'package:flutter/material.dart';
import 'package:epharma/services/pref_service.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';


class Driver {
  String user_name;
  String email;
  String phone;
  String address;
  String _id;

  Driver(this.user_name, this.email, this.phone, this.address, this._id);
}

class DriverProfService {
  final baseUrl = 'https://e-pharma-server.herokuapp.com';

  Future<Driver> getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Driver driver;
    Logger().i("push $token");

    return Dio()
      .get(
        '$baseUrl/me?token=$token',
      )
        .then((res) async {
          Logger().i("$res");

        if (res.statusCode == 200) {
          Logger().i("prof: ${res.data["data"]}");
          var f = res.data["data"];
          Logger().i("f: ${f["avatar_url"]}");
          
          driver = Driver (
            f["user_name"],
            f["email"],
            f["phone"],
            f["address"],
            f["_id"]
          );

          Logger().i("d: ${driver}");
          Logger().i("prof");
          return driver;
        }
        Logger().i("returned false");
        return driver;

    }).catchError((err) => driver);
  } 

  Future<bool> _saveToken(String token) {
    return SharedPreferences.getInstance().then((instance) {
      return instance.setString("token", token);
    });  
  }
  Future<String> _getToken() {
    return SharedPreferences.getInstance().then((instance) {
      return instance.getString("token");
    });
  }

}