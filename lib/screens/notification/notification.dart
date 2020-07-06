import 'package:flutter/material.dart';

class Notification_Tab extends StatefulWidget {
  @override
  _Notification_TabState createState() => _Notification_TabState();
}

class _Notification_TabState extends State<Notification_Tab> {
  final List<String> sender = <String>['Pharmacist', 'Admin', 'Client(Order Id:12556)'];
  final List<String> msg = <String>['You have 15 deliveries tomorrow', 'Check the PENDING orders to accept orders for next day', 'Can you deliver the package after noon?'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.cyan[200],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.separated(
      padding: const EdgeInsets.all(12),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: sender.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            padding: EdgeInsets.only(top: 10),
            height:60,
            width: 500,
            color: Colors.cyan[50],
            child: Row(
              children: <Widget>[
                Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      child: Container(
                        child: Align(
                          child: Text(
                              '  Sender: ${sender[index]}',
                              style: TextStyle(
                                fontSize: 15.0,
                              )
                          ),
                        ),

                      ),
                    ),
                    Align(
                      child: Container(
                        child: Text(
                            '  Message: ${msg[index]}',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.blueGrey[600],
                            )
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
      ),
    );
  }
}

