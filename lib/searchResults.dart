import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/model.searchResult.dart';
import 'package:food_scanner/foodDetails.dart';

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
            // TODO extend to show multiple results
            return FoodDetails(snapshot.data.foods[0]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Text('');
          }
        });
  }
}
