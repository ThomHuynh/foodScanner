import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/searchResult.dart';
import 'package:food_scanner/widgets/foodList.dart';

import '../services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final foodSearchController = TextEditingController();
  Future<SearchResult> _futureSearchResult;
  var response;

  @override
  void dispose() {
    foodSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(left: 18, bottom: 18),
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: Palette.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                    cursorColor: Palette.primary,
                    controller: foodSearchController,
                    decoration: InputDecoration(
                      fillColor: Palette.bars,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Enter food name...',
                      isDense: true,
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Palette.onSurfaceMedium,
                      ),
                    ),
                    onSubmitted: (String value) async {
                      setState(() {
                        _futureSearchResult = getSearchResults(value);
                      });
                    }),
              ),
              Container(
                child: FoodList(_futureSearchResult),
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.only(top: 18),
              )
            ],
          ),
          margin: EdgeInsets.only(top: 18),
        ),
      ]),
    );
  }
}
