import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';
import 'package:collection/collection.dart';

class NutritionGrid extends StatelessWidget {
  final List<FoodNutrient> nutrients;

  Map getFats() {
    Map fats = new Map();

    if (nutrients.firstWhereOrNull(
            (nutrient) => nutrient.name == 'Total lipid (fat)') !=
        null) {
      fats['total'] = nutrients
          .firstWhereOrNull((nutrient) => nutrient.name == 'Total lipid (fat)');
    }
    if (nutrients.firstWhereOrNull(
            (nutrient) => nutrient.name == 'Fatty acids, total saturated') !=
        null) {
      fats['saturated'] = nutrients.firstWhereOrNull(
          (nutrient) => nutrient.name == 'Fatty acids, total saturated');
    }
    if (nutrients.firstWhereOrNull((nutrient) =>
            nutrient.name == 'Fatty acids, total monosaturated') !=
        null) {
      fats['monosaturated'] = nutrients.firstWhereOrNull(
          (nutrient) => nutrient.name == 'Fatty acids, total monosaturated');
    }
    if (nutrients.firstWhereOrNull((nutrient) =>
            nutrient.name == 'Fatty acids, total polyunsaturated') !=
        null) {
      fats['polyunsaturated'] = nutrients.firstWhereOrNull(
          (nutrient) => nutrient.name == 'Fatty acids, total polyunsaturated');
    }

    return fats;
  }

  FoodNutrient findNutrient(String name) {
    if (name == 'Energy') {
      return nutrients
          .firstWhereOrNull((nutrient) => nutrient.unitName == 'KCAL');
    } else {
      return nutrients.firstWhereOrNull(
          (nutrient) => nutrient.name.contains(RegExp('\\b$name\\b')));
    }
  }

  NutritionGrid(this.nutrients);

  @override
  Widget build(BuildContext context) {
    FoodNutrient energy = findNutrient('Energy');
    FoodNutrient carbohydrate = findNutrient('Carbohydrate');
    FoodNutrient sugars = findNutrient('Sugars');
    FoodNutrient protein = findNutrient('Protein');
    FoodNutrient sodium = findNutrient('Sodium');

    if (energy != null) {
      print('Energy: ${energy.value}');
    } else {
      print('Energy: null');
    }
    if (carbohydrate != null) {
      print('Carbohydrate: ${carbohydrate.value}');
    } else {
      print('Carbohydrate: null');
    }
    if (sugars != null) {
      print('Sugars: ${sugars.value}');
    } else {
      print('Sugars: null');
    }
    if (protein != null) {
      print('Protein" ${protein.value}');
    } else {
      print('Protein: null');
    }
    if (sodium != null) {
      print('Sodium ${sodium.value}');
    } else {
      print('Sodium: null');
    }

    // Map fats = getFats();
    // fats.forEach((key, value) {
    //   print('$key:${value.value}');
    // });

    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        // color: Palette.bars,
        child: Column(
          children: <Widget>[
            Flexible(
                child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Palette.surface,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [Text('Energy'), Text('Energy')],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text('Energy'),
                    Text('Fats'),
                  ],
                ),
              ),
            ]))
          ],
        ));
  }
}
