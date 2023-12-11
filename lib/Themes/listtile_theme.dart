import 'package:flutter/material.dart';

class CListTileTheme {
  static ListTileThemeData lightListTile = ListTileThemeData(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black),
    ),
  );
  static ListTileThemeData darkListTile = ListTileThemeData(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.white),
    ),
  );
}
