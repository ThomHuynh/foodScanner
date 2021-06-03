import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';
import 'package:food_scanner/widgets/nutritionGrid.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  FoodDetailScreen(this.food);

  List<DataRow> mapToDataRow(List<FoodNutrient> nutrients) {
    List<DataRow> list = [];

    food.foodNutrients.forEach((nutrient) {
      list.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(nutrient.name)),
          DataCell(Text('${nutrient.value} ${nutrient.unitName}')),
        ],
      ));
    });

    return list;
  }

  FoodNutrient findNutrient(String name) {
    if (name == 'Energy') {
      return food.foodNutrients
          .firstWhereOrNull((nutrient) => nutrient.unitName == 'KCAL');
    }
    if (name == 'Fat') {
      FoodNutrient fat = food.foodNutrients.firstWhereOrNull(
          (FoodNutrient nutrient) =>
              nutrient.name.contains(RegExp('\\bfat\\b')));
      return fat;
    } else {
      return food.foodNutrients.firstWhereOrNull((FoodNutrient nutrient) =>
          nutrient.name.contains(RegExp('\\b$name\\b')));
    }
  }

  List<FoodNutrient> findAllNutrients(String name) {
    List<FoodNutrient> list = [];
    list = food.foodNutrients
        .where((FoodNutrient nutrient) =>
            nutrient.name.contains(RegExp('\\b$name\\b')))
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<FoodNutrient> firstRow = [];
    List<FoodNutrient> secondRow = [];
    List<FoodNutrient> vitamins = [];

    FoodNutrient energy = findNutrient('Energy');
    if (energy != null) {
      firstRow.add(energy);
    }
    FoodNutrient carbohydrate = findNutrient('Carbohydrate');
    if (carbohydrate != null) {
      firstRow.add(carbohydrate);
    }
    FoodNutrient sugars = findNutrient('Sugars');
    if (sugars != null) {
      firstRow.add(sugars);
    }

    FoodNutrient fat = findNutrient('Fat');
    if (fat != null) {
      secondRow.add(fat);
    }
    FoodNutrient protein = findNutrient('Protein');
    if (protein != null) {
      secondRow.add(protein);
    }
    FoodNutrient sodium = findNutrient('Sodium');
    if (sodium != null) {
      secondRow.add(sodium);
    }
    FoodNutrient cholesterol = findNutrient('Cholesterol');
    if (cholesterol != null) {
      secondRow.add(cholesterol);
    }

    vitamins = findAllNutrients('Vitamin');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.bars,
        title: Text(
          food.description,
          style: TextStyle(
            color: Palette.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: Palette.onSurfaceMedium),
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                    text: food.scientificName ?? '',
                    style: TextStyle(
                      color: Palette.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ))
              ])),
            ),
            Text('Nutrition Facts - Amount Per 100 grams'),
            NutritionHorizontalList(firstRow),
            NutritionHorizontalList(secondRow),
            NutritionHorizontalList(vitamins),
            DataTable(
              columnSpacing: 25,
              dataRowHeight: 25,
              headingRowHeight: 35,
              horizontalMargin: 0,
              columns: const <DataColumn>[
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Amount')),
              ],
              rows: mapToDataRow(food.foodNutrients),
            ),
            Text(
                '*Per cent Daily Values are based on a 2,000 calorie diet. Your daily values may be higher or lower depending on your calorie needs.')
          ],
        ),
      ),
    );
  }
}
