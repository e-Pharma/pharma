//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

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
  Future<void> getData() async {
    await SharedPreferences.getInstance().then((prefs){
      token=prefs.getString("token");

    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response=await get('https://e-pharma-server.herokuapp.com/driver/get/'+decodedToken.claims['id']);
    print(response.body);
    setState(() {
      driverData=jsonDecode(response.body)['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      //get the image from the gallery
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

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
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              SizedBox(height: 20.0),
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
                          width:100,
                          height:100,
                          //setting up the image which is picked up in gallery
                          child: (_image != null)? Image.file(_image, fit: BoxFit.fill)
                          :Image.asset(
                            'images/driver.jpg',
                            fit: BoxFit.fill,  
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:60),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30.0,
                        color: Colors.cyan[400],
                      ), 
                      onPressed: (){
                        getImage();
                      },
                    ),
                  ),
                ],
              ),

              // SafeArea(
              //   top: false,
              //   bottom: false,
              //   child: new Form(
              //     key: _formKey,
              //     autovalidate: true,
              //     child: new ListView(
              //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //       children: <Widget>[
              //         new TextFormField(
              //           decoration: const InputDecoration(
              //             icon: const Icon(Icons.person),
              //             hintText: 'Enter your name',
              //             labelText: 'Name',
              //           ),
              //         ),
              //         new TextFormField(
              //           decoration: const InputDecoration(
              //             icon: const Icon(Icons.phone),
              //             hintText: 'Enter email',
              //             labelText: 'Email',
              //           ),
              //           keyboardType: TextInputType.emailAddress,
              //           // inputFormatters: [
              //           //   WhitelistingTextInputFormatter.digitsOnly,
              //           // ],
              //         ),
              //       ],
              //     ), 
              //     ),
                
              //   ),
              
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget> [
              //       Text(
              //         'Username',
              //         style: TextStyle(
              //           color: Colors.blueGrey,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //       SizedBox(width: 20.0),
              //       Text(
              //         driverData['user_name'],
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.create,
              //             size: 20.0,
              //             color: Colors.blueGrey,
              //           ), 
              //           onPressed: (){},
              //         ),
              //       ),
              //     ),
              //     ],
              //   ),
              // ),
              
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget> [
              //       Text(
              //         'Phone',
              //         style: TextStyle(
              //           color: Colors.blueGrey,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //       SizedBox(width: 20.0),
              //       Text(
              //         driverData['phone'],
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.create,
              //             size: 20.0,
              //             color: Colors.blueGrey,
              //           ), 
              //           onPressed: (){},
              //         ),
              //       ),
              //     ),
              //     ],
              //   ),
              // ),
             
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget> [
              //       Text(
              //         'Address',
              //         style: TextStyle(
              //           color: Colors.blueGrey,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //       SizedBox(width: 20.0),
              //       Text(
              //         driverData['address'],
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.create,
              //             size: 20.0,
              //             color: Colors.blueGrey,
              //           ), 
              //           onPressed: (){},
              //         ),
              //       ),
              //     ),
              //     ],
              //   ),
              // ),
             
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      driverData['email'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.red[300],
                    onPressed: (){
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
                FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green[300],
                    onPressed: (){
                      //uploadPic(context);
                    },
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

