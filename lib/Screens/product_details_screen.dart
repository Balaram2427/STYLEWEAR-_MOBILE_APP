import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // Dummy product data
    final product = {
      'id': productId,
      'name': 'Product Name',
      'description': 'This is a detailed description of the product.',
      'price': 29.99,
      'imageUrl': 'https://via.placeholder.com/150'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] as String),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['imageUrl'] as String),
            SizedBox(height: 16.0),
            Text(
              product['name'] as String,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product['price']}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              product['description'] as String,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
