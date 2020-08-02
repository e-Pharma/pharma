import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:epharma/services/order_service.dart';
import 'dart:convert';

class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  Future <List<Order>> _getOrderData() async {
    var orderData= await http.get("https://e-pharma-server.herokuapp.com/admin/orders?value=pending");
    var jsonData= json.Decode(orderData.body);
    List<Order> orders = [];
    for (var ord in jsonData)
    {
      Order order= Order (ord["name"]);
      orders.add(order);
    }
    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: FutureBuilder(
          future: _getOrderData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data== null){
              return Container(
                child: Center(
                  Text("Loading...."),
                ),
              )
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemNuilder(BuildContext context, int index){
              return ListTile(
              title: Text (snapshot.data.name),
              );
              },
              );
            }
          },
        ),
      ),
    );
  }
}
