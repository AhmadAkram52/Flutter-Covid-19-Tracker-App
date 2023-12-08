import 'package:covid_tracker/Themes/theme.dart';
import 'package:covid_tracker/View/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CovidTracker());
}

class CovidTracker extends StatelessWidget {
  const CovidTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CTheme.lightTheme,
      darkTheme: CTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
