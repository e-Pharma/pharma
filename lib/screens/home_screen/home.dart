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
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                /*UserAccountsDrawerHeader(
                  //UserAccountsDrawerHeader
                  margin: EdgeInsets.zero,
                  accountName: Text('Sankha Jay'),
                  accountEmail: Text('sankharc@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: 
                      Theme.of(context).platform == TargetPlatform.android
                        ? Colors.cyan[200]
                        : Colors.white,
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 40.0),                  
                    ),
                  ),
                ),*/
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
                /*ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('My Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),*/
                /*ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.message),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('messages'),
                      ),
                    ],
                  ),
                ),*/
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
              isScrollable: true,
              tabs: choices.map(
                (Choice choice) {
                    return Container(
                      width: MediaQuery.of(context).size.width /4,
                      child: Tab(
                        text: choice.title,
                        icon: Icon(choice.icon),
                        
                      ),
                    );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: choices.map((Choice choice) {
                return Padding(
                  padding: EdgeInsets.zero,
                  //child: ChiceCard(choice: choice),
                );
              }).toList(),
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

const List<Choice> choices = const <Choice> [
  //const Choice(icon:Icons.dehaze),
  const Choice(title: 'CHATS'),
  const Choice(title: 'STATUS'),
  const Choice(title: 'CALLS'),
];


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