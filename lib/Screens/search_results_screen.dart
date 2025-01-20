import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<String> searchResults;

  const SearchResultsScreen({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: searchResults.isEmpty
          ? Center(
              child: Text('No results found'),
            )
          : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                );
              },
            ),
    );
  }
}
