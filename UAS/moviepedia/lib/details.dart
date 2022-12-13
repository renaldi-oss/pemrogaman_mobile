import 'package:flutter/material.dart';

import 'package:Moviepedia/utils/text.dart';

class Details extends StatelessWidget {
  // deklarasi variabel yang akan digunakan
  final String name, desc, bannerurl, posterurl, vote, launch_on;
  // constructor
  const Details(
      {super.key,
      required this.name,
      required this.desc,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});
  // widget build untuk menampilkan detail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // listview untuk menampilkan detail
        child: ListView(
          children: [
            Container(
              height: 250,
              // stack untuk menampilkan gambar banner
              child: Stack(
                children: [
                  // positioned digunakan untuk menempatkan widget
                  // di posisi tertentu
                  Positioned(
                      child: Container(
                    height: 250,
                    // mengambil lebar layar mengunakan MediaQuery
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: ModifiedText(
                        text: ' ⭐ Average Rating : ' + vote,
                        color: Colors.white,
                        size: 16,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              // edgeinsets digunakan untuk memberikan jarak pada widget
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: name != null ? name : 'Not Loaded',
                color: Colors.white,
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on: ' + launch_on,
                color: Colors.white,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                    child: Container(
                  child: ModifiedText(
                    text: desc,
                    color: Colors.white,
                    size: 18,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
