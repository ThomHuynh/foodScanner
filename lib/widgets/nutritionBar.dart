import 'package:flutter/material.dart';
import 'package:food_scanner/config/config.dart';
import 'package:food_scanner/model/food.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainNutritionHorizontalList extends StatelessWidget {
  final List<FoodNutrient> nutrients;
  final bool large;

  MainNutritionHorizontalList(
    this.nutrients,
    this.large,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 100.0 + (large ? 50.0 : 0.0),
        // MediaQuery.of(context).size.height * (0.125 + (large ? 0.07 : 0)),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: nutrients.map((FoodNutrient nutrient) {
            if (large) {
              return buildMainNutrientCard(context, nutrient.name.split(',')[0],
                  nutrient.value, nutrient.unitName, Palette.bars);
            } else {
              return buildMainNutrientCard(context, nutrient.name.split(',')[0],
                  nutrient.value, nutrient.unitName, Palette.bars);
            }
          }).toList(),
        ));
  }

  Container buildMainNutrientCard(BuildContext context, String title, num value,
      String unitName, Color color) {
    double percentage = 0.3;

    if (title.contains(RegExp('\\bEnergy\\b')))
      percentage = num.parse((value / 2000).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bCarbohydrate\\b')))
      percentage = num.parse((value / 275).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bfat\\b')))
      percentage = num.parse((value / 78).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bSugars\\b')))
      percentage = num.parse((value / 50).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bFiber\\b')))
      percentage = num.parse((value / 28).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bProtein\\b')))
      percentage = num.parse((value / 50).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bCholesterol\\b')))
      percentage = num.parse((value / 50).toStringAsFixed(4));
    else if (title.contains(RegExp('\\bSodium\\b')))
      percentage = num.parse((value / 2300).toStringAsFixed(4));

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: title,
                  style: TextStyle(color: Palette.onSurface),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            if (large)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45,
                    // width: MediaQuery.of(context).size.width * 0.15,
                    child: Text(
                      '$value $unitName',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircularPercentIndicator(
                    backgroundColor: Palette.surface,
                    radius: 80.0,
                    lineWidth: 8.0,
                    percent: (percentage > 1) ? 1 : percentage,
                    center:
                        new Text("${(percentage * 100).toStringAsFixed(2)}%"),
                    progressColor: Palette.primary,
                  ),
                ],
              ),
            if (!large)
              Container(
                width: 100,
                child: Text(
                  '$value $unitName',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
