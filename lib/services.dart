import 'package:food_scanner/model/food.dart';
import 'package:food_scanner/model/searchResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<SearchResult> getSearchResults(String value) async {
// TODO refactor api request for generalization
  Uri url = Uri.https('api.nal.usda.gov', '/fdc/v1/foods/search', {
    'api_key': 'xdB5Kz8rvwFnQz6U6TWo1abZbnds3cZA8VIlHpOs',
    'limit': '2',
    'dataType': ['Foundation', 'SR Legacy'],
    'query': '$value',
    'pageSize': '20'
  });

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    SearchResult result = SearchResult.fromJson(jsonDecode(response.body));
    return result;
  } else {
    throw Exception('Failed to load search results');
  }
}

// TODO write api request for food detail
getFoodDetails(int id) async {
  Uri url = Uri.https('api.nal.usda.gov', '/fdc/v1/food/${id}', {
    'api_key': 'xdB5Kz8rvwFnQz6U6TWo1abZbnds3cZA8VIlHpOs',
  });

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    Food result = Food.fromJson(jsonDecode(response.body));
    return result;
  } else {
    throw Exception('Failed to load food details for fdcId $id');
  }
}
