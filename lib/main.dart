import 'package:flutter/material.dart';
import 'package:food_scanner/screens/startScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      home: StartScreen(),
    );
  }
}
