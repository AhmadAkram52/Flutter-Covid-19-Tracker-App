import 'package:flutter/material.dart';

class TextFieldTheme {
  static InputDecorationTheme lightTextField = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    filled: true,
    fillColor: Colors.black12,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black),
    ),
  );
  static InputDecorationTheme darkTextField = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    filled: true,
    fillColor: Colors.white12,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white),
    ),
  );
}
