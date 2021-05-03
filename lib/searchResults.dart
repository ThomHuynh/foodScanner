import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/foodList.dart';
import 'package:food_scanner/model.searchResult.dart';

class SearchResults extends StatelessWidget {
  final Future<SearchResult> _futureSearchResult;

  SearchResults(this._futureSearchResult);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResult>(
        future: _futureSearchResult,
        builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return FoodList(snapshot.data.foods);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Text('');
          }
        });
  }
}
