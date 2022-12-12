import 'package:flutter/material.dart';

import 'package:Moviepedia/utils/text.dart';

class Details extends StatelessWidget {
  final String name, desc, bannerurl, posterurl, vote, launch_on;

  const Details(
      {super.key,
      required this.name,
      required this.desc,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
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
