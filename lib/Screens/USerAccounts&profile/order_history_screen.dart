import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: OrderHistoryList(),
    );
  }
}

class OrderHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This is just a placeholder for your order history items
    final orders = List.generate(10, (index) => 'Order $index');

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(orders[index]),
          subtitle: Text('Order details for ${orders[index]}'),
          onTap: () {
            // Handle order item tap
          },
        );
      },
    );
  }
}