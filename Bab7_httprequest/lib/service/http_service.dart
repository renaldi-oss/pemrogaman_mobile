import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/models/movies.dart';

class HttpService {
  // kunci api yang didapat dari imdb-api
  final String apiKey = "k_yy125oc6";
  final String baseUrl = "https://imdb-api.com/en/API/Top250Movies/";

  Future<List?> getPopularMovie() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");

      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movies.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
