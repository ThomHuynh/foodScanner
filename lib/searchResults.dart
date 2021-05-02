import 'package:flutter/cupertino.dart';
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
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData) {
            return Text(SearchResult.formatSearchResult(snapshot.data));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Text('');
          }
        });
  }
}
