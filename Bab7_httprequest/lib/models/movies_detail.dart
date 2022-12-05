
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapi/models/movies.dart';

class MoviesDetail extends StatelessWidget{
  final Movies movies;
  final String imgpath = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";

  MoviesDetail(this.movies);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String path = "";
    if(movies.posterPath != null){
      path = imgpath + movies.posterPath;
    }else{

    }
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height/1.5,
                child: Image.network(path),
              ),
              Container(
                child: Text(movies.overview),
                padding: EdgeInsets.only(left: 16 , right: 16),
              ),
            ],
          ),
        ),
        ),
    );
  }

  
}