import 'package:flutter/material.dart';
import 'package:food_scanner/config/palette.dart';
import 'package:food_scanner/screens/startScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: ,
        primaryColor: Palette.primary,
        accentColor: Palette.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      home: StartScreen(),
    );
  }
}
