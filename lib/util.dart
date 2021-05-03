import 'package:food_scanner/model.searchResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// TODO refactor api request for generalization
Future<SearchResult> getData(String value) async {
  var url = Uri.https('api.nal.usda.gov', '/fdc/v1/foods/search', {
    'api_key': 'xdB5Kz8rvwFnQz6U6TWo1abZbnds3cZA8VIlHpOs',
    'limit': '2',
    'dataType': ['Foundation', 'SR Legacy'],
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
