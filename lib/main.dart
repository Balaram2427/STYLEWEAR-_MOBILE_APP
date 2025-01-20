import 'package:flutter/material.dart';
import 'package:stylewaer1/Screens/Payments/payment_screen.dart' as payments;
import 'package:stylewaer1/Screens/Product%20browsing/product_browsing_screen.dart'
    as browsing;
import 'package:stylewaer1/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/product-browsing': (context) => browsing.ProductBrowsingScreen(),
        '/product-detail': (context) => browsing.ProductDetailScreen(
              product: {},
            ),
        '/cart': (context) => browsing.CartScreen(
              product: {},
            ),
        '/payment-summary': (context) => browsing.PaymentSummaryScreen(
              product: {},
            ),
        '/payment': (context) => payments.PaymentScreen(),
        // other routes
      },
    );
  }
}
