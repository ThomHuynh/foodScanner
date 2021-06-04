import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Palette.background,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: Palette.primary,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Palette.primary,
          selectionColor: Palette.primary.withOpacity(0.5),
          selectionHandleColor: Palette.primary,
        ),
        brightness: Brightness.dark,
        primaryColor: Palette.primary,
        primaryColorDark: Palette.primary,
        primaryColorBrightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      home: BottomNavScreen(),
    );
  }
}
