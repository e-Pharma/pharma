import 'package:flutter/material.dart';
import 'package:epharma/services/pref_service.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String driver;

class AuthService {
  final baseUrl = 'https://e-pharma-server.herokuapp.com';
  Future<bool> login(String user_name, String password){
    print("here");
    driver = user_name;
    Logger().i('$user_name');
    Logger().i('$password');
    Logger().i( 'Uri $baseUrl/driver/login?user_name=$user_name&password=$password');
    return Dio().get(
      '$baseUrl/driver/login?user_name=$user_name&password=$password',

    ).then((res) async {
      Logger().i('$res');
      if (res.statusCode == 200) {
        print(res);
        String token = res.data["data"]["token"];
        return await _saveToken(token);
      }
      return false;
    }).catchError((err) => false);
  }

  Future<bool> logout()  async {
    //BuildContext context;
    await SharedPreferences.getInstance().then((prefs){
      prefs.remove("token");

    });

    Logger().i("logout");
    return true;
  }

  Future<bool> _saveToken(String token) async {
    return await SharedPreferences.getInstance().then((instance) {
      //Logger().i('$token');
      print(token);
      instance.setString("driver", driver);
      instance.setString("token", token);
      return true;
    }).catchError((err) => false);
  }

  Future<bool> isLoggedIn(){
    return PrefService()
        .getToken()
        .then((token) => (token != null) ? true : false)
        .catchError((error) => Logger().e(error));
  }

  //Future<bool> getProfileData(){
  //   PrefService()
  //       .getToken()
  //       .then((token) =>{
  //       Dio().get((baseUrl+"/getProfile/"+token.id)).then((value) => print(value)).catchError(onError=>print(onError))
  //       })
  //       .catchError((error) => Logger().e(error));
  // }

}
