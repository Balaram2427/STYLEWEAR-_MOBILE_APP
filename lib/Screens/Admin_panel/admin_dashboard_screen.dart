import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Users'),
            onTap: () {
              // Navigate to the users management
            },
          ),
          ListTile(
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/order-management');
            },
          ),
          ListTile(
            title: Text('Products'),
            onTap: () {
              Navigator.pushNamed(context, '/manage-products');
            },
          ),
        ],
      ),
    );
  }
}