import 'package:covid_tracker/Themes/list-tile_theme.dart';
import 'package:covid_tracker/Themes/text-field_theme.dart';
import 'package:flutter/material.dart';

class CTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    inputDecorationTheme: TextFieldTheme.lightTextField,
    listTileTheme: CListTileTheme.lightListTile,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    inputDecorationTheme: TextFieldTheme.darkTextField,
    listTileTheme: CListTileTheme.darkListTile,
  );
}
