import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';

class MainNutritionHorizontalList extends StatelessWidget {
  final List<FoodNutrient> nutrients;
  final bool large;

  MainNutritionHorizontalList(this.nutrients, this.large);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height:
            MediaQuery.of(context).size.height * (0.12 + (large ? 0.075 : 0)),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: nutrients.map((FoodNutrient nutrient) {
            return buildMainNutrientCard(context, nutrient.name.split(',')[0],
                nutrient.value, nutrient.unitName, Palette.bars);
          }).toList(),
        ));
  }

  Container buildMainNutrientCard(BuildContext context, String title, num value,
      String unitName, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.34,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Palette.onSurface),
            ),
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
