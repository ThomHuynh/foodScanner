import 'package:flutter/material.dart';
import 'package:food_scanner/model.food.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;

  FoodList(this.foods);

  List<Widget> mapFoods(List<Food> foods) {
    List<Widget> list = [];

    foods.forEach((Food food) {
      list.add(Card(
        child: ListTile(
          title: Text(food.description),
        ),
      ));
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO make cards clickable -> go to product details
    return ListView(
      shrinkWrap: true,
      children: mapFoods(foods),
    );
  }
}
