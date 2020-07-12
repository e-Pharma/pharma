import 'package:flutter/material.dart';
//import 'package:pharma/screens/edit_profile/editProfile.dart';
import 'package:epharma/screens/drawer/edit_profile/editProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: InkWell(),
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
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
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
                        image: new AssetImage("images/driver.jpg"),
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
          SizedBox(height: 5),
          Container(
            child: ListTile(
              title: Center(
                child: Text(
                  'Michael',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: Center(child: Text('ABC')),
            ),
          ),
          SizedBox(height: 2),
          Container(
            child: CustomListTile(
              Icons.person,
              'Id',
              () => {},
              "#56892324"
            ),
          ),
          Container(
            child: CustomListTile(
              Icons.email,
              'Email',
              () => {},
              "michael89@gmail.com"
            ),
          ),
          Container(
            child: CustomListTile(
              Icons.phone,
              'Phone',
              () => {},
              "0716009027"
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 100.0, right: 100.0, top: 50.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.cyan[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "EDIT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon}); //constructor
  final String title; //properties
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  //const Choice(icon:Icons.dehaze),
  const Choice(title: 'Name'),
  const Choice(title: 'STATUS'),
  const Choice(title: 'CALLS'),
];

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  String data;

  CustomListTile(this.icon, this.text, this.onTap,this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade500)),
        ),
        child: InkWell(
          splashColor: Colors.cyan[200],
          onTap: onTap,
          child: Container(
            height: 50,
            child: Column(
            
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Colors.grey.shade500,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  data,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
