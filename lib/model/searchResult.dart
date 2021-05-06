import 'package:flutter/material.dart';
import 'package:food_scanner/model/food.dart';

// TODO find system for this model, name, etc. Maybe put this into food.dart
class SearchResult {
  final List<Food> foods;

  const SearchResult({
    @required this.foods,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    List<Food> foodList = [];
    for (var i in json['foods']) {
      Food food = Food.fromJson(i);
      foodList.add(food);
    }
    return SearchResult(
      // totalHits: json['totalHits'],
      foods: foodList,
    );
  }

  static String formatSearchResult(SearchResult searchResult) {
    String formattedResult = '';
    searchResult.foods[0].foodNutrients.forEach((nutrient) {
      formattedResult +=
          '\t${nutrient.nutrientName}: ${nutrient.value}${nutrient.unitName} ';
    });

    return formattedResult;
  }
}
