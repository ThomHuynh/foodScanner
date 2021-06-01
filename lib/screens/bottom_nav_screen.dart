import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/screens/foodDetailsScreen.dart';
import 'package:food_scanner/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Palette.primary,
        unselectedItemColor: Palette.onSurface,
        items: [
          [CupertinoIcons.home, 'Home'],
          [CupertinoIcons.bookmark, 'Bookmarks']
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: value[1],
                    icon: Icon(value[0]),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
