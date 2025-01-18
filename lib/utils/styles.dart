import 'package:flutter/material.dart';

class AppStyles {
  // Define text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  // Define button styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    textStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  );

  static final ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
    textStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  );

  // Define color palette
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.grey;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
}