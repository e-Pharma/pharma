import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:epharma/model/order.dart';
//import 'package:epharma/services/order_service.dart';
import 'dart:convert';

class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  List<Order> orders = [];
  Future<void> _getOrderData() async {
    var orderData = await http.get(
        "https://e-pharma-server.herokuapp.com/admin/orders?value=completed");
    var jsonData = json.decode(orderData.body);
    // print(jsonData);
    List<Order> temp = [];

    for (var ord in jsonData['data']) {
      print(ord);

      //print(ord);
      // Order order = new Order(
      //     ord["name"],
      //     ord["contact"],
      //     ord["delivery_address"],
      //     ord["prescription_url"]
      //     );

      // Order order = new Order(
      //     ord["id"],
      //     ord["clientId"],
      //     ord["name"],
      //     ord["delivery_address"],
      //     ord["email"],
      //     ord["patient"],
      //     ord["contact"],
      //     ord["nic"],
      //     ord["ordered_at"],
      //     ord["delivery_charges"],
      //     ord["full_amount"],
      //     ord["prescription_url"]
      //     );

      Order order = new Order(
          id: ord['id'],
          clientId: ord['clientId'],
          name: ord['name'],
          delivery_address: ord['delivery_address'],
          email: ord['email'],
          patient: ord['patient'],
          contact: ord['contact'],
          nic: ord['nic'],
          ordered_at: ord['ordered_at'],
          delivery_charges: ord['delivery_charges'],
          full_amount: ord['full_amount'],
          prescription_url: ord['prescription_url']);
      temp.add(order);
    }
    setState(() {
      orders = temp;
    });
    print(orders);
    // return orders;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOrderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: orders.length == 0
              ? SpinKitChasingDots(
                  color: Colors.cyan[400],
                )
              : ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(orders[index].prescription_url),
                      ),
                      title: Text(orders[index].name.toString()),
                      subtitle: Text(orders[index].delivery_address.toString()),
                      trailing: Text(orders[index].contact.toString()),
                      onTap: () {},
                    );
                  })
//          FutureBuilder(
//           future: _getOrderData(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data== null){
//               return Container(
//                 child: Center(
//                   child: Text("Loading...."),
//                 ),
//               );
//             }
//             else{
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text (snapshot.data[index].name.toString()),
//                   //  title: Text (snapshot.data[index].title),
// //                    subtitle: Text(snapshot.data[index].title),
//                   );
//                 },
//               );
//             }
//           },
//         ),
          ),
    );
  }
}
