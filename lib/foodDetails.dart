import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_scanner/model.food.dart';

class FoodDetails extends StatelessWidget {
  final Food food;

  FoodDetails(this.food);

  List<DataRow> mapToDataRow(List<FoodNutrient> nutrients) {
    List<DataRow> list = [];

    food.foodNutrients.forEach((nutrient) {
      list.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(
            nutrient.nutrientName,
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            '${nutrient.value} ${nutrient.unitName}',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ));
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(food.description),
      DataTable(
        columns: const <DataColumn>[
          DataColumn(
              label: Text(
            'Name',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Amount',
            style: TextStyle(color: Colors.white),
          )),
        ],
        rows: mapToDataRow(food.foodNutrients),
      )
    ]);
  }
}
