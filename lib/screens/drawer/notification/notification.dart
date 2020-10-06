import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Notification_Tab extends StatefulWidget {
  @override
  _Notification_TabState createState() => _Notification_TabState();
}

// ignore: camel_case_types
class _Notification_TabState extends State<Notification_Tab> {
  String token;
  List Notification;

  String id;
  String sender;
  String message;

  Future getNotification() async {
    await SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString("token");
    });
    var decodedToken = new JWT.parse(token);
    print(decodedToken.claims['id']);

    Response response =
        await get("https://e-pharma-server.herokuapp.com/driver/notifications");
    return jsonDecode(response.body)['data'];
  }

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
      body: FutureBuilder(
          future: this.getNotification(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              print("Loading notifications for delivery person ..");

              return Center(
                child: SpinKitChasingDots(color: Colors.cyan[400]),
              );
            } else {
              print("Notifications came to the front end");
              Notification = snapshot.data;

              return ListView.builder(
                  itemCount: Notification.length,
                  itemBuilder: (BuildContext context, int index) {
                    sender = Notification[index]['sender'];
                    message = Notification[index]['message'];
                    return Container(
                      child: ListTile(
                        title: Text(Notification[index]['sender']),
                        subtitle: Text(Notification[index]['message']),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        // onTap: () {
                        //   _popupDialog(Notification[index]);
                        // },
                      ),
                    );
                  });
            }
          }),
    );
  }

//   final List<String> sender = <String>['Pharmacist', 'Client(Order Id:12556)'];
//   final List<String> msg = <String>['Check the PENDING orders to accept orders for next day', 'Can you deliver the package after noon?'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: const Text(
//           'Notifications',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30.0,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         backgroundColor: Colors.cyan[200],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(top: 20),
//         child: ListView.separated(
//       padding: const EdgeInsets.all(12),
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: sender.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//             padding: EdgeInsets.only(top: 10),
//             height:60,
//             width: 500,
//             color: Colors.cyan[50],
//             child: Row(
//               children: <Widget>[
//                 Column(
// //                  mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Align(
//                       child: Container(
//                         child: Align(
//                           child: Text(
//                               '  Sender: ${sender[index]}',
//                               style: TextStyle(
//                                 fontSize: 15.0,
//                               )
//                           ),
//                         ),

//                       ),
//                     ),
//                     Align(
//                       child: Container(
//                         child: Text(
//                             '  Message: ${msg[index]}',
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               color: Colors.blueGrey[600],
//                             )
//                         ),
//                       ),
//                     ),

//                   ],
//                 ),

//               ],
//             )
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(),
//     ),
//       ),
//     );
//   }

}
