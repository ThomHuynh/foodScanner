import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
            NutritionGrid(food.foodNutrients),
            // TODO energy
            // fat, x-saturated fats
            // carbohydrates, Zusammensetzung
            // sugar
            // protein
            // sodium
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
