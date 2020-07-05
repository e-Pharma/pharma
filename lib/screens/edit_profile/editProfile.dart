import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //create a variable of type File
  File _image;
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
              
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Michael',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ), 
                        onPressed: (){},
                      ),
                    ),
                  ),
                  ],
                ),
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize:18.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'K.D.S.L.Waidyarathne',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ), 
                        onPressed: (){},
                      ),
                    ),
                  ),
                ],
              ),*/
              
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      '0716009027',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ), 
                        onPressed: (){},
                      ),
                    ),
                  ),
                  ],
                ),
              ),
             
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      'Address',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Colombo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.create,
                          size: 20.0,
                          color: Colors.blueGrey,
                        ), 
                        onPressed: (){},
                      ),
                    ),
                  ),
                  ],
                ),
              ),
             
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
                      'michael89@gmail.com',
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

