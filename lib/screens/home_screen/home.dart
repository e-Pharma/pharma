import 'package:flutter/material.dart';

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
                        //icon: Icon(choice.icon),
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
  const Choice(title: 'CHATS', icon: Icons.message),
  const Choice(title: 'STATUS', icon: Icons.donut_small),
  const Choice(title: 'CALLS', icon: Icons.call),
];

