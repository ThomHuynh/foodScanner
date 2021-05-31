import 'package:flutter/material.dart';

import 'package:food_scanner/screens/foodDetailsScreen.dart';
import 'package:food_scanner/model/food.dart';
import 'package:food_scanner/model/searchResult.dart';

class FoodList extends StatelessWidget {
  final Future<SearchResult> _futureSearchResult;

  FoodList(this._futureSearchResult);

  List<Widget> mapFoods(BuildContext context, List<Food> foods) {
    // higher prio for foundational foods
    foods.forEach((Food f) {
      if (f.dataType == 'Foundation') {
        f.score += 500;
      }
    });

    foods.sort((a, b) => b.score.compareTo(a.score));

    List<Widget> list = [];

    foods.forEach((Food food) {
      list.add(
        InkWell(
          child: Card(
            child: ListTile(
              title: Text(food.description),
              subtitle: Text('ID:${food.id}     ${food.category ?? ''}'),
            ),
          ),
          onTap: () {
            // TODO food detail request for food.id

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
