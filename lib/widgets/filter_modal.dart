import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add your filter options here
            FilterOption(title: 'Category'),
            FilterOption(title: 'Price Range'),
            FilterOption(title: 'Brand'),
            FilterOption(title: 'Size'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Apply filter logic
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;

  const FilterOption({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        // Add specific filter widgets here (e.g., checkboxes, sliders)
        SizedBox(height: 10),
      ],
    );
  }
}
