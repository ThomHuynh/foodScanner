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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('FOOD SCANNER 🥕')),
              FoodSearch(),
            ]),
      ),
    );
  }
}

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  final foodSearchController = TextEditingController();

  @override
  void dispose() {
    foodSearchController.dispose();
    super.dispose();
  }

  Future<String> getData(String value) async {
    var url = Uri.https('api.nal.usda.gov', '/fdc/v1/foods/search', {
      'api_key': 'xdB5Kz8rvwFnQz6U6TWo1abZbnds3cZA8VIlHpOs',
      'dataType': ['Foundation', 'SR Legacy', 'Survey (FNDSS)'],
      'limit': '1',
      'query': '$value',
      'pageSize': '1'
    });

    http.Response response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: TextField(
            controller: foodSearchController,
            decoration: InputDecoration(hintText: 'Enter food name...'),
            onSubmitted: (String value) async {
              getData(value);
            }));
  }
}
