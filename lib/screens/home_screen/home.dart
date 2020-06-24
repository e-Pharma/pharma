import 'package:flutter/material.dart';
import 'package:pharma/screens/my_profile/myProfilePage.dart';

//import 'package:flutter/src/widgets/navigator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color> [
                        Colors.cyan[200],
                        Colors.cyan[600],
                      ],
                    ),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget> [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('images/shani.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'K.D',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                CustomListTile(
                  Icons.person,
                  'My Profile',
                  () => {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => Profile()),
                    ),
                  },
                ),
                CustomListTile(
                  Icons.notifications,
                  'Notifications',
                  () => {},
                ),
                CustomListTile(
                  Icons.settings,
                  'Settings',
                  () => {},
                ),
                CustomListTile(
                  Icons.lock,
                  'Log Out',
                  () => {},
                ),
        
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.cyan[200],
            title: const Text(
              'e-Pharma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              tabs: [
                Tab(
                  child: Text('ONGOING'),
                ),
                Tab(
                  child: Text('PREVIOUS'),
                ),
                Tab(
                  child: Text('MAP'),
                ),
              ],
              ),
            ),
            body: TabBarView(
              children: [
                new Card(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                          child: Material(
                            color: Colors.white,
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Colors.cyan[200],
                            child: Row(
                              children: <Widget> [
                                Container(
                                  child: Text(
                                    'Order Details',
                                    
                                  ),
                                ),
                                //SizedBox(width:50.0),
                                Container(
                                  child: ClipRRect(
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.cyan[400],
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Card(
                  color: Colors.yellow[50],
                  child: Center(child: Text('Tab2')),
                ),
                new Card(
                  color: Colors.yellow[200],
                  child: Center(child: Text('Tab3')),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class Choice {
  const Choice({this.title, this.icon}); //constructor
  final String title; //properties
  final IconData icon;
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Row(
                  children: <Widget>[
                    Icon(icon, color: Colors.grey.shade500,),
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
                
                Icon(Icons.arrow_right, color: Colors.grey.shade500,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}