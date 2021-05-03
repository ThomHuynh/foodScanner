import 'package:flutter/material.dart';

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
    List<FoodNutrient> foodNutrientList = [];
    for (var i in list) {
      FoodNutrient foodNutrient = FoodNutrient.fromJson(i);
      if (foodNutrient.value > 0) {
        foodNutrientList.add(foodNutrient);
      }
    }
    return Food(
      id: json['fdcId'],
      description: json['description'],
      foodNutrients: foodNutrientList,
    );
  }
}

class FoodNutrient {
  final int nutrientId;
  final String nutrientName;
  final String nutrientNumber;
  final String unitName;
  final String derivationCode;
  final String derivationDescription;
  final num value;

  FoodNutrient({
    @required this.nutrientId,
    @required this.nutrientName,
    @required this.nutrientNumber,
    @required this.unitName,
    @required this.derivationCode,
    @required this.derivationDescription,
    @required this.value,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) {
    return FoodNutrient(
      nutrientId: json['nutritionId'],
      nutrientName: json['nutrientName'],
      nutrientNumber: json['nutrientNumber'],
      unitName: json['unitName'],
      derivationCode: json['derivationCode'],
      derivationDescription: json['derivationDescription'],
      value: json['value'],
    );
  }
}
