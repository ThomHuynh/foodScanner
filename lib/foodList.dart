import 'package:flutter/material.dart';
import 'package:food_scanner/foodDetails.dart';
import 'package:food_scanner/model.food.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;

  FoodList(this.foods);

  List<Widget> mapFoods(BuildContext context, List<Food> foods) {
    List<Widget> list = [];

    foods.forEach((Food food) {
      list.add(
        InkWell(
          child: Card(
            child: ListTile(
              title: Text(food.description),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailScreen(food)));
          },
          splashColor: Colors.blue.withAlpha(30),
        ),
      );
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: mapFoods(context, foods),
    );
  }
}
