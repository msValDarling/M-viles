import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pmsna/models/popular_model.dart';

class ApiPopular {
  Uri link = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=e39514f1e08e1a21eab40030b6ade0c7&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular() async {
    var result = await http.get(link);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if (result.statusCode == 200) {
      return listJSON.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }
}
