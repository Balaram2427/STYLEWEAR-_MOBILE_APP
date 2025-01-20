import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Traditional Wear',
    'Contemporary',
    'Fusion',
    'Occasion-Based',
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Column(
        children: [
          Image.asset('assets/image1.png'), // Display the image
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  onTap: () {
                    // Navigate to the category-specific screen
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
