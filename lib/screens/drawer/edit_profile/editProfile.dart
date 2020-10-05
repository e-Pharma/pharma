//import 'dart:html';

import 'package:epharma/routes/application.dart';
import 'package:epharma/services/auth_service.dart';
import 'package:epharma/services/driverdata_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //create a variable of type File
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  File _image;
  String token;
  Map driverData;

  String user_name;
  String address;
  String phone;
  //String email;

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

  //Driver driver = new Driver();

  editDriver() async {
    // TODO: implemebt post

    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      Get.snackbar("Not enough data", "Give necessery details",
          // duration: Duration(milliseconds: 20),
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    } else {
      await SharedPreferences.getInstance().then((prefs) {
        token = prefs.getString("token");
      });
      var decodedToken = new JWT.parse(token);
      print(decodedToken.claims['id']);
      Response response = await post(
        'https://e-pharma-server.herokuapp.com/driver/edit/' +
            decodedToken.claims['id'],
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': user_name,
          'address': address,
          'phone': phone
        }),
      );

      if (response.statusCode == 202) {
        print("success");
        return Get.snackbar("Successs", "Driver details updated",
            duration: Duration(milliseconds: 200),
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.error,
              color: Colors.red,
            ));
      } else {
        print("error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      //get the image from the gallery
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    return Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.cyan[200],
      ),
      body: FutureBuilder(
          future: this.getData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              print("error");
              return Center(child: SpinKitChasingDots(color: Colors.black));
            } else {
              print("data retrieved");
              print(snapshot.data);
              driverData = snapshot.data;
              phone = driverData['phone'];
              address = driverData['address'];
              user_name = driverData['user_name'];
              //var user_name = driverData['user_name'];
              return SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                  key: _formKey,
                  autovalidate: true,
                  child: new ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.cyan[400],
                              child: ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  //setting up the image which is picked up in gallery
                                  child: (_image != null)
                                      ? Image.file(_image, fit: BoxFit.fill)
                                      : Image.asset(
                                          'images/driver.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                              
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60),
                            child: IconButton(
                              icon: Icon(
                                Icons.add_a_photo,
                                size: 30.0,
                                color: Colors.cyan[400],
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: "ID",
                        ),
                        initialValue: driverData['_id'],
                        enabled: false,
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: "Name",
                        ),
                        initialValue: driverData['user_name'],
                        //enabled: false,
                        onChanged: (newValue) => user_name = newValue,
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          labelText: "Email",
                        ),
                        initialValue: driverData['email'],
                        // validator: (value) =>
                        //     value.isEmpty ? 'Email is required' : null,
                        // //onSaved: (val) => email=val;
                        enabled: false,
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          labelText: "Phone",
                        ),
                        initialValue: driverData['phone'],
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) =>
                            value.isEmpty ? 'Mobile number is required' : null,
                        onChanged: (newValue) => phone = newValue,
                        //validator: (value) => isValidPhoneNumber(value) ? null : 'Phone number must be entered as (###)###-####',
                      ),
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.room),
                          labelText: "Address",
                        ),
                        initialValue: driverData['address'],
                        validator: (value) =>
                            value.isEmpty ? 'Address is required' : null,
                        onChanged: (newValue) => address = newValue,
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.red[300],
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            splashColor: Colors.blueGrey,
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.green[300],
                            onPressed: () {
                              editDriver();
                            },
                            splashColor: Colors.blueGrey,
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
