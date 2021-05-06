import 'package:flutter/material.dart';

import 'package:food_scanner/screens/foodDetailsScreen.dart';
import 'package:food_scanner/model/food.dart';
import 'package:food_scanner/model/searchResult.dart';

class FoodList extends StatelessWidget {
  final Future<SearchResult> _futureSearchResult;

  FoodList(this._futureSearchResult);

  List<Widget> mapFoods(BuildContext context, List<Food> foods) {
    List<Widget> list = [];

    foods.forEach((Food food) {
      list.add(
        InkWell(
          child: Card(
            child: ListTile(
              title: Text(food.description),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailScreen(food)));
          },
          splashColor: Colors.blue.withAlpha(30),
        ),
      );
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResult>(
        future: _futureSearchResult,
        builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Column(
              children: mapFoods(context, snapshot.data.foods),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Text('');
          }
        });
  }
}
