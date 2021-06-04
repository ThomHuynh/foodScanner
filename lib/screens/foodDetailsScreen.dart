import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';
import 'package:food_scanner/widgets/nutritionBar.dart';

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
    List<String> mainNutrients_1 = [
      'Energy',
      'Carbohydrate',
      'Sugars',
      'Fiber'
    ];
    List<String> mainNutrients_2 = ['Fat', 'Protein', 'Sodium', 'Cholesterol'];
    List<String> sideNutrients_1 = [
      'Zinc, Zn',
      'Calcium, Ca',
      'Iron, Fe',
      'Selenium,Se',
      'Magnesium, Mg',
      'Potassium, K',
      'Copper, Cu',
      'Phosphorus, P',
      'Manganese, Mn',
      'Fluoride, F'
    ];

    List<FoodNutrient> vitamins = findAllNutrients('Vitamin');

    List<FoodNutrient> firstRow = [];
    for (String item in mainNutrients_1) {
      FoodNutrient nutrient = findNutrient(item);
      if (nutrient != null) {
        firstRow.add(nutrient);
      }
    }
    List<FoodNutrient> secondRow = [];
    for (String item in mainNutrients_2) {
      FoodNutrient nutrient = findNutrient(item);
      if (nutrient != null) {
        secondRow.add(nutrient);
      }
    }
    List<FoodNutrient> thirdRow = [];
    for (String item in sideNutrients_1) {
      FoodNutrient nutrient = findNutrient(item);
      if (nutrient != null) {
        thirdRow.add(nutrient);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: Text(
          food.description,
          style: TextStyle(
            color: Palette.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        iconTheme: IconThemeData(color: Palette.onSurfaceMedium),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 18, top: 18),
            child: Text(
              food.scientificName ?? '',
              style: TextStyle(
                color: Palette.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18, top: 24),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.onSurface,
                  fontSize: 22),
            ),
          ),
          if (firstRow.isNotEmpty) MainNutritionHorizontalList(firstRow, true),
          if (secondRow.isNotEmpty)
            MainNutritionHorizontalList(secondRow, true),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '*Per cent Daily Values are based on a 2,000 kcal diet. Your daily values may be higher or lower depending on your calorie needs.',
              style: TextStyle(color: Palette.onSurfaceMedium, fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18, top: 24),
            child: Text(
              'More Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.onSurface,
                  fontSize: 22),
            ),
          ),
          if (vitamins.isNotEmpty) MainNutritionHorizontalList(vitamins, false),
          if (thirdRow.isNotEmpty) MainNutritionHorizontalList(thirdRow, false),
          // DataTable(
          //   columnSpacing: 25,
          //   dataRowHeight: 25,
          //   headingRowHeight: 35,
          //   horizontalMargin: 0,
          //   columns: const <DataColumn>[
          //     DataColumn(label: Text('Name')),
          //     DataColumn(label: Text('Amount')),
          //   ],
          //   rows: mapToDataRow(food.foodNutrients),
          // ),
        ],
      ),
    );
  }
}
