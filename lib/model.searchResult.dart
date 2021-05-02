import 'package:flutter/material.dart';
import 'package:food_scanner/model.food.dart';

class SearchResult {
// class SearchResult extends StatelessWidget {
  // TODO turn result into own widget
  final int totalHits;
  final List<Food> foods;
  // final Future<SearchResult> futureSearchResult;

  const SearchResult({
    @required this.totalHits,
    @required this.foods,
    // @required this.futureSearchResult,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    List<Food> foodList = [];
    for (var i in json['foods']) {
      Food food = Food.fromJson(i);
      foodList.add(food);
    }
    return SearchResult(
      totalHits: json['totalHits'],
      foods: foodList,
    );
  }

  static String formatSearchResult(SearchResult searchResult) {
    // TODO visualize response

    String formattedResult = '';
    searchResult.foods[0].foodNutrients.forEach((nutrient) {
      formattedResult +=
          '\t${nutrient.nutrientName}: ${nutrient.value}${nutrient.unitName} ';
    });

    return formattedResult;
  }
}
