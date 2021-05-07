import 'package:flutter/material.dart';
import 'package:food_scanner/model/food.dart';

// TODO refine data model make more use of response data
class SearchResult {
  final List<Food> foods;
  final int totalHits;
  final int currentPage;
  final int totalPages;

  const SearchResult({
    @required this.foods,
    @required this.totalHits,
    @required this.currentPage,
    @required this.totalPages,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    List<Food> foodList = [];
    for (var i in json['foods']) {
      Food food = Food.fromJson(i);
      foodList.add(food);
    }
    return SearchResult(
      foods: foodList,
      totalHits: json['totalHits'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
    );
  }

  static String formatSearchResult(SearchResult searchResult) {
    String formattedResult = '';
    searchResult.foods[0].foodNutrients.forEach((nutrient) {
      formattedResult +=
          '\t${nutrient.name}: ${nutrient.amount}${nutrient.unitName} ';
    });

    return formattedResult;
  }
}
