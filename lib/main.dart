import 'package:flutter/cupertino.dart';
import 'package:food_scanner/model.searchResult.dart';
import 'package:food_scanner/searchResults.dart';
import 'package:food_scanner/util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Food Scanner',
        home: Builder(builder: (BuildContext context) {
          return DefaultTextStyle(
            style: CupertinoTheme.of(context).textTheme.textStyle,
            child: CupertinoPageScaffold(
              child: ListView(children: [
                Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'FOOD SCANNER 🥕🔍',
                    )),
                Container(padding: EdgeInsets.all(16.0), child: FoodSearch()),
              ]),
            ),
          );
        }));
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
      CupertinoSearchTextField(
          controller: foodSearchController,
          placeholder: 'Enter food name...',
          onSubmitted: (String value) async {
            setState(() {
              _futureSearchResult = getData(value);
            });
          }),
      SearchResults(_futureSearchResult),
    ]);
  }
}
