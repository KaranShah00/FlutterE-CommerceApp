import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//
//import 'package:provider/provider.dart';
//
//import '../providers/orders.dart' as ord;
//import '../widgets/order_item.dart';
//import '../widgets/app_drawer.dart';
//
//class OrdersScreen extends StatefulWidget {
//  static const routeName = '/orders';
//
//  @override
//  _OrdersScreenState createState() => _OrdersScreenState();
//}
//
//class _OrdersScreenState extends State<OrdersScreen> {
//
//  @override
//  void initState() {
//    super.initState();
//    Future.delayed(Duration.zero).then((_){
//      Provider.of<ord.Orders>(context, listen: false).fetchAndSetOrders();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final orderData = Provider.of<ord.Orders>(context);
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Your orders'),
//      ),
//      drawer: AppDrawer(),
//      body: ListView.builder(
//        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
//        itemCount: orderData.orders.length,
//      ),
//    );
//  }
//}
