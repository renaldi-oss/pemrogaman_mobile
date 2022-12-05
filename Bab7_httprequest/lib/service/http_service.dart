import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/models/movies.dart';

class HttpService{
  final String apiKey = "5652c473ed28e50d70dc9c8bca75bdfc";
  final String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=";

  Future<List?> getPopularMovie() async{
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));

    if(result.statusCode == HttpStatus.ok){
      print("Sukses");
      
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movies.fromJson(i)).toList();
      return movies;
    }else{
      print("Fail");
      return null;
    }

  }
}