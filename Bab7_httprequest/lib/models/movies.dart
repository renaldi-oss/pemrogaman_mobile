
class Movies{
  late int id;
  late String title;
  late double voteAverage;
  late String overview;
  late String posterPath;


  Movies(this.id , this.title , this.voteAverage , this.overview , this.posterPath);

  Movies.fromJson(Map<String , dynamic> parsedJson){
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];


  }
}