import 'package:flutter/material.dart';

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
