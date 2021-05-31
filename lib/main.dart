import 'package:flutter/material.dart';
import 'package:food_scanner/config/palette.dart';
import 'package:food_scanner/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Palette.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      home: BottomNavScreen(),
    );
  }
}
