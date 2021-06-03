import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';

class NutritionHorizontalList extends StatelessWidget {
  final List<FoodNutrient> nutrients;

  NutritionHorizontalList(this.nutrients);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 18),
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: nutrients.map((FoodNutrient nutrient) {
            return buildFoodNutrientCard(nutrient.name, nutrient.value,
                nutrient.unitName, Palette.surface);
          }).toList(),
        ));
  }

  Container buildFoodNutrientCard(
      String title, num value, String unitName, Color color) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              '$value $unitName',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
