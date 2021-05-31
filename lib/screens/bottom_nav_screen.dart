import 'package:flutter/material.dart';
import 'package:food_scanner/config/palette.dart';
import 'package:food_scanner/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.background,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Palette.primary,
        // unselectedItemColor: Palette.onSurface,
        items: [Icons.home, Icons.bookmark]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      decoration: BoxDecoration(
                          // color: _currentIndex == key
                          //     ? Palette.onSurface
                          //     : Colors.transparent,
                          // borderRadius: BorderRadius.circular(20.0),
                          ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
