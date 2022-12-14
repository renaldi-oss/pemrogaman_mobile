import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:Moviepedia/utils/text.dart';
import 'package:Moviepedia/widgets/topRated.dart';
import 'package:Moviepedia/widgets/trending.dart';
import 'package:Moviepedia/widgets/tv.dart';

void main() => runApp(new MyApp());

// Sets the theme of app which is stateless
// because there is no internal data to take care of
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        // used light color scheme because dark color scheme was not giving indigo app bar
        theme: ThemeData(
          colorScheme: ColorScheme.light().copyWith(primary: Colors.indigo),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // list penampung data trending movies, top rated movies, dan tv
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  // api dan akses token yang didapat dari themoviedb.org setelah registrasi
  final String apiKey = '19a6518e906cccb38135d94746994643';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOWE2NTE4ZTkwNmNjY2IzODEzNWQ5NDc0Njk5NDY0MyIsInN1YiI6IjYzOTJiMzM3ZDdmYmRhMDA5NWVkMDNmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TqiOzNz42uXWv7du3yu9m45jIFWu_YSF8Tu6p8dAWhc';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  // fungsi untuk memuat data trending movies, top rated movies, dan tv
  // async dan await digunakan untuk menunggu data selesai diambil dari API
  // sebelum dilanjutkan ke proses selanjutnya
  loadMovies() async {
    // membuat objek tmdb dengan konfigurasi log yang diinginkan
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    // memanggil fungsi getTrending, getTopRated, dan getPopular dari objek tmdb
    // map digunakan untuk menampung data yang diambil dari API
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    // print(trendingResults);
    // set state untuk mengubah data yang ada di list ke data yang baru
    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvResults['results'];
    });
    // print(trendingMovies);
  }

  // widget yang akan ditampilkan
  // build context digunakan untuk mengatur tampilan widget
  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan untuk menampilkan AppBar dan Body
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: ModifiedText(
            text: 'Moviepedia',
            color: Colors.white,
            size: 24,
          ),
        ),
        // listview digunakan untuk menampilkan widget secara vertikal
        body: ListView(
          children: [
            TrendingMovies(trending: trendingMovies),
            TopRated(topRated: topRatedMovies),
            TV(tv: tv),
          ],
        ));
  }
}
