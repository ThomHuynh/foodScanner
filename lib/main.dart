import 'package:flutter/material.dart';
import 'package:food_scanner/model/searchResult.dart';
import 'package:food_scanner/service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      home: Scaffold(
        body: ListView(children: [
          Container(
              padding: EdgeInsets.all(16.0), child: Text('FOOD SCANNER 🥕🔍')),
          Container(padding: EdgeInsets.all(16.0), child: FoodSearch()),
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
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          controller: foodSearchController,
          decoration: InputDecoration(hintText: 'Enter food name...'),
          onSubmitted: (String value) async {
            setState(() {
              _futureSearchResult = getData(value);
            });
          }),
      FutureBuilder<SearchResult>(
          future: _futureSearchResult,
          builder:
              (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Text(SearchResult.formatSearchResult(snapshot.data));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Text('');
            }
          }),
    ]);
  }
}
