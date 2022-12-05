import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapi/models/movies_detail.dart';
import 'package:restapi/service/http_service.dart';

class MovieList extends StatefulWidget {
  
  @override
  _MovieList createState() => _MovieList();
}

class _MovieList extends State<MovieList> {
  int moviesCount =0;
  late List movies;
  late HttpService service;
  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  
  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovie())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movie"),
        ),
        body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount ,
          itemBuilder: (context , int position ){
            return Card(
              color: Colors.white,
              elevation : 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(this.image_url + movies[position].posterPath),
                   
                ),
                title: Text(movies[position].title),
                subtitle: Text(
                  "Rating = " + movies[position].voteAverage.toString(), 
                ),
                onTap: (){
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MoviesDetail(movies[position]));
                    Navigator.push(context , route);
                },
              ),
            );
          }
        ),
    );
  }
}
