import 'package:flutter/material.dart';
import 'package:food_scanner/model.searchResult.dart';
import 'package:food_scanner/searchResults.dart';
import 'package:food_scanner/util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      home: Scaffold(
        body: ListView(children: [
          // TODO fix scrollable
          Container(
            child: Text(
              'FOOD SCANNER',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: FoodSearch(),
          ),
        ]),
      ),
    );
  }
}

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
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
    return Column(
      children: [
        TextField(
            controller: foodSearchController,
            decoration: InputDecoration(
              hintText: 'Enter food name...',
            ),
            onSubmitted: (String value) async {
              setState(() {
                _futureSearchResult = getData(value);
              });
            }),
        Container(
          child: SearchResults(_futureSearchResult),
          padding: EdgeInsets.only(top: 24),
        )
      ],
    );
  }
}
