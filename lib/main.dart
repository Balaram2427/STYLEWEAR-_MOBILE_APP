import 'package:flutter/material.dart';
import 'package:stylewaer1/Screens/Admin_panel/admin_dashboard_screen.dart';
import 'package:stylewaer1/Screens/Payments/payment_screen.dart' as payments;
import 'Screens/Product browsing/product_browsing_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/Schelduling&Delivery/delivery_schedule_screen.dart'; // Import the scheduling screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylewear',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: HomeScreen(), // Set initial screen
      routes: {
        '/admin': (context) => AdminDashboardScreen(),
        '/product-browsing': (context) => ProductBrowsingScreen(),
        '/payment': (context) => payments.PaymentScreen(), // Ensure correct import
        '/scheduling': (context) => DeliveryScheduleScreen(), // Add the scheduling route
        '/profile': (context) => ProfileScreen(),
        // '/vendor-management': (context) => VendorManagementScreen(),
      },
    );
  }
}