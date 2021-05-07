import 'package:flutter/material.dart';

class Food {
  // Unique ID of the food
  final int id;

  // The type of the food data
  final String dataType;

  // The description of the food
  final String description;

  // Unique ID identifying the food within FDDS
  final String foodCode;

  List<FoodNutrient> foodNutrients;

  // Data the item was published to FDC
  final String publicationDate;

  // The scientific name of the food
  final String scientificName;

  // Brand owner for the food. Only applies to branded foods
  final String brandOwner;

  // GTIN or UPC code identifying the food. Only applies to Branded Foods
  final String gtinUpc;

  // List of ingredients (as it appears on the product label). Only applies to Branded Foods
  final String ingredients;

  // Unique number assigned for foundation foods. Only applies to Foundation and SRLegacy Foods.
  final String ndbNumber;

  // Any additional descriptions of the food
  final String additionalDescription;

  // allHighlightFields
  final String allHighlightFields;

  // Relative score indicating how well the food matches the search criteria
  final double score;

  Food({
    @required this.id,
    @required this.dataType,
    @required this.description,
    @required this.foodCode,
    @required this.foodNutrients,
    @required this.publicationDate,
    @required this.scientificName,
    @required this.brandOwner,
    @required this.gtinUpc,
    @required this.ingredients,
    @required this.ndbNumber,
    @required this.additionalDescription,
    @required this.allHighlightFields,
    @required this.score,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    List list = json['foodNutrients'];
    List<FoodNutrient> foodNutrientList = [];
    for (var i in list) {
      FoodNutrient foodNutrient = FoodNutrient.fromJson(i);
      if (foodNutrient.amount > 0) {
        foodNutrientList.add(foodNutrient);
      }
    }

    return Food(
      id: json['fdcId'],
      dataType: json['dataType'],
      description: json['description'],
      foodCode: json['fdcId'],
      foodNutrients: foodNutrientList,
      publicationDate: json['publicationDate'],
      scientificName: json['scientificName'],
      brandOwner: json['brandOwner'],
      gtinUpc: json['gtinUpc'],
      ingredients: json['ingredients'],
      ndbNumber: json['ndbNumber'],
      additionalDescription: json['additionalDescription'],
      allHighlightFields: json['allHighlightFields'],
      score: json['score'],
    );
  }
}

class FoodNutrient {
  final int id;
  final String name;
  final String number; // Difference between id and number unclear
  final String unitName;
  final String derivationCode;
  // example: Calculated from a daily value percentage per serving size measure
  final String derivationDescription;

  final double amount;

  FoodNutrient({
    @required this.id,
    @required this.name,
    @required this.number,
    @required this.unitName,
    @required this.derivationCode,
    @required this.derivationDescription,
    @required this.amount,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) {
    return FoodNutrient(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      unitName: json['unitName'],
      derivationCode: json['derivationCode'],
      derivationDescription: json['derivationDescription'],
      amount: json['amount'],
    );
  }
}
