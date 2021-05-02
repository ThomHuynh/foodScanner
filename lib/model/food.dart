import 'package:flutter/material.dart';
import 'package:food_scanner/model/foodNutrient.dart';

class Food {
  final int id;
  final String description;
  List<FoodNutrient> foodNutrients;

  Food(
      {@required this.id,
      @required this.description,
      @required this.foodNutrients});

  factory Food.fromJson(Map<String, dynamic> json) {
    List list = json['foodNutrients'];
    // print('Nutrient list: $list');
    List<FoodNutrient> foodNutrientList = [];
    for (var i in list) {
      FoodNutrient foodNutrient = FoodNutrient.fromJson(i);
      foodNutrientList.add(foodNutrient);
    }
    return Food(
      id: json['fdcId'],
      description: json['description'],
      foodNutrients: foodNutrientList,
    );
  }
}
