import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Scanner',
      home: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.all(16.0), child: Text('FOOD SCANNER 🥕🔍')),
          Container(padding: EdgeInsets.all(16.0), child: FoodSearch()),
        ]),
      ),
    );
  }
}

class SearchResult {
  final int totalHits;
  final List<Food> foods;

  SearchResult({@required this.totalHits, @required this.foods});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    List list = json['foods'];
    List<Food> foodList = [];
    for (var i in list) {
      Food food = Food.fromJson(i);
      foodList.add(food);
    }
    return SearchResult(
      totalHits: json['totalHits'],
      foods: foodList,
    );
  }
}

class Food {
  final int id;
  final String description;
  List<FoodNutrient> foodNutrients;

  Food(
      {@required this.id,
      @required this.description,
      @required this.foodNutrients});

  factory Food.fromJson(Map<String, dynamic> json) {
    List list = json['foodNutrients'];
    // print('Nutrient list: $list');
    List<FoodNutrient> foodNutrientList = [];
    for (var i in list) {
      FoodNutrient foodNutrient = FoodNutrient.fromJson(i);
      foodNutrientList.add(foodNutrient);
    }
    return Food(
      id: json['fdcId'],
      description: json['description'],
      foodNutrients: foodNutrientList,
    );
  }
}

class FoodNutrient {
  final int nutrientId;
  final String nutrientName;
  final String nutrientNumber;
  final String unitName;
  final String derivationCode;
  final String derivationDescription;
  final num value;

  FoodNutrient({
    @required this.nutrientId,
    @required this.nutrientName,
    @required this.nutrientNumber,
    @required this.unitName,
    @required this.derivationCode,
    @required this.derivationDescription,
    @required this.value,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) {
    return FoodNutrient(
      nutrientId: json['nutritionId'],
      nutrientName: json['nutrientName'],
      nutrientNumber: json['nutrientNumber'],
      unitName: json['unitName'],
      derivationCode: json['derivationCode'],
      derivationDescription: json['derivationDescription'],
      value: json['value'],
    );
  }
}

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  final foodSearchController = TextEditingController();
  Future<SearchResult> futureSearchResult;

  @override
  void dispose() {
    foodSearchController.dispose();
    super.dispose();
  }

  Future<SearchResult> getData(String value) async {
    var url = Uri.https('api.nal.usda.gov', '/fdc/v1/foods/search', {
      'api_key': 'xdB5Kz8rvwFnQz6U6TWo1abZbnds3cZA8VIlHpOs',
      'limit': '2',
      'dataType': ['Foundation', 'SR Legacy', 'Survey (FNDSS)'],
      'query': '$value',
      'pageSize': '1'
    });

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var result = SearchResult.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          controller: foodSearchController,
          decoration: InputDecoration(hintText: 'Enter food name...'),
          onChanged: (String value) async {
            // TODO this should trigger FutureBuilder
            futureSearchResult = getData(value);
          }),
      FutureBuilder<SearchResult>(
          future: futureSearchResult,
          builder:
              (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Text(// TODO visualize response
                  '${snapshot.data.foods[0].foodNutrients[0].nutrientName}: ${snapshot.data.foods[0].foodNutrients[0].value} ${snapshot.data.foods[0].foodNutrients[0].unitName}');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Text('Something weird');
            }
          }),
    ]);
  }
}
