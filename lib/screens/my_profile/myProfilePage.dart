import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InkWell(),
      appBar: new AppBar(
        title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
        backgroundColor: Colors.cyan[200],
      ),
      body: ListView(
        children: <Widget> [
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:30.0),
                child: ClipPath(
                //clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.cyan[400]),
                    
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/shani.jpg"),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          
        ],
      ),
    );
  }
}

