import 'package:flutter/material.dart';
import 'package:food_scanner/model/food.dart';

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
    // TODO fetch details for one food item by FDC ID
    // TODO display main things with nice visualization
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                food.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
