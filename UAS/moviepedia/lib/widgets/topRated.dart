import 'package:flutter/material.dart';
import 'package:Moviepedia/details.dart';
import 'package:Moviepedia/utils/text.dart';

class TopRated extends StatelessWidget {
  // tipe data final digunakan untuk menetapkan nilai yang tidak dapat diubah
  final List topRated;
  // constructor untuk menginisialisasi nilai dari variabel topRated
  const TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menggunakan widget ModifiedText untuk mengubah properti text
          ModifiedText(
            text: 'Top Rated Movies',
            color: Colors.white,
            size: 20,
          ),
          // sizedbox digunakan untuk memberikan jarak antar widget
          SizedBox(
            height: 10,
          ),
          // container untuk menampung widget listview builder
          Container(
            height: 270,
            // list view builder digunakan untuk menampilkan data top rated movies
            child: ListView.builder(
                itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return InkWell(
                    // Using the Navigator API to navigate to 2nd screen
                    // to get details of a particular top-rated movie
                    onTap: () {
                      // navigator.push digunakan untuk navigasi ke halaman kedua
                      Navigator.push(
                          context,
                          // material page digunakan untuk menampilkan halaman kedua
                          MaterialPageRoute(
                              builder: (context) => Details(
                                  name: topRated[index]['title'],
                                  desc: topRated[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['poster_path'],
                                  vote: topRated[index]['vote_average']
                                      .toString(),
                                  launch_on: topRated[index]['release_date'])));
                    },
                    child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              topRated[index]['poster_path']))),
                            ),
                            Container(
                              child: ModifiedText(
                                text: topRated[index]['title'] != null
                                    ? topRated[index]['title']
                                    : 'Loading',
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          ],
                        )),
                  );
                })),
          )
        ],
      ),
    );
  }
}
