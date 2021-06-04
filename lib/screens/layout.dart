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
    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100,
            ),
            Text('Under Construction'),
          ],
        ),
      ),
    )
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: Text(
          'Food Scanner',
          style: TextStyle(color: Palette.onSurface, fontSize: 16),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.bars,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Palette.primary,
        unselectedItemColor: Palette.onSurfaceMedium,
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
