import 'package:flutter/material.dart';
import 'package:food_scanner/model/searchResult.dart';
import 'package:food_scanner/widgets/foodList.dart';
import 'package:food_scanner/services.dart';

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
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        TextField(
            controller: foodSearchController,
            decoration: InputDecoration(
              hintText: 'Enter food name...',
            ),
            onSubmitted: (String value) async {
              setState(() {
                _futureSearchResult = getSearchResults(value);
              });
            }),
        Container(
          child: FoodList(_futureSearchResult),
          padding: EdgeInsets.only(top: 24),
        )
      ],
    );
  }
}
