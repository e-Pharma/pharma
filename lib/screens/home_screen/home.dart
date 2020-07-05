import 'package:flutter/material.dart';
import 'package:epharma/screens/my_profile/myProfilePage.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:flutter/src/widgets/navigator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

}

class _HomeScreenState extends State<HomeScreen> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
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
                          backgroundImage: AssetImage('images/driver.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Michael',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
                  child: Text('PENDING'),
                ),
                Tab(
                  child: Text('ONGOING'),
                ),
                Tab(
                  child: Text('HISTORY'),
                ),
              ],
              ),
            ),
            body: TabBarView(
              children: [
                new Card(
                  color: Color(0xffdfd4f4),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget> [
                      Container(
                        child: SimpleFoldingCell(
                          key: _foldingCellKey,
                          frontWidget: FrontWidget(), 
                          innerTopWidget: InnerTopWidget(), 
                          innerBottomWidget: InnerBottomWidget(),
                                                  
                          cellSize: Size(MediaQuery.of(context).size.width,175),
                          padding: EdgeInsets.all(10.0),

                          onOpen: () => print('cell opened'),
                          onClose: () => print('cell closed'),
                        ),
                      ),
                    ],
                  ),
                ),
              new Card(
                color: Color(0xffdfd4f4),
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget> [
                      Container(
                        child: SimpleFoldingCell(
                          key: _foldingCellKey,
                          frontWidget: FrontWidget(), 
                          innerTopWidget: InnerTopWidget(), 
                          innerBottomWidget: InnerBottomWidgetOnGoing(),
                                                  
                          cellSize: Size(MediaQuery.of(context).size.width,175),
                          padding: EdgeInsets.all(10.0),

                          onOpen: () => print('cell opened'),
                          onClose: () => print('cell closed'),
                        ),
                      ),
                    ],
                  ),
              ),
              new Card(
                color: Color(0xffdfd4f4),
                child: Center(child: Text('Tab3')),
              ),
            ],
          ),
        ),
      ),
    );
  }
Container InnerBottomWidgetOnGoing() {
  return Container(
    color: Colors.white,
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(bottom:10),
      
      child: FlatButton(
        onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
        child: Text("Start Ride"),
        textColor: Colors.black,
        color: Colors.red[300],
        splashColor: Colors.white.withOpacity(0.5),
      ), 
    ),
  );
}

  Container FrontWidget() {
  return Container(
    color: Color(0xffdfd4f4),
    alignment: Alignment.center,
    child: Row(
      children: <Widget> [
        
        Expanded(
          flex: 1,
          child: Container(
            decoration: new BoxDecoration (
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.cyan[400],
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Order No:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Order Id : #12569',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget> [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.room,
                            color: Colors.black,
                            size: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Gangodawila, Nugegoda',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                    child: Text("Open"),
                    textColor: Colors.black,
                    color: Colors.cyan[400],
                    splashColor: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
  Container InnerTopWidget() {
  return Container(
    color: Colors.cyan[400],
    alignment: Alignment.center,
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Order Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget> [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Mr.Joseph',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget> [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '0712282935',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget> [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Icon(
                        Icons.today,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '8-7-2020',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget> [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Icon(
                        Icons.room,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Gangodawila, Nugegoda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ),
              Container(),
            ],
          ),
        ],
      ),
    ),

  );
}
  Container InnerBottomWidget() {
  return Container(
    color: Colors.white,
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(bottom:10),
      child: FlatButton(
        onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
        child: Text("Accept"),
        textColor: Colors.black,
        color: Colors.green[300],
        splashColor: Colors.white.withOpacity(0.5),
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