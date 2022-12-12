import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Cuaca Sederhana",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  // data dari API OpenWeatherMap
  var apiName = "https://api.openweathermap.org/data/2.5/weather?q=";
  // patokan kota yang akan ditampilkan pada saat pertama kali membuka aplikasi
  var cityName = "Malang";
  // API Key dari OpenWeatherMap
  var apiKey = "&imperial&appid=2bb0aecc9fa16c8d63acc3941ab7024f";
  // fungsi untuk mengambil data dari API OpenWeatherMap
  // future adalah sebuah fungsi yang akan mengembalikan nilai
  // pada saat prosesnya selesai dilakukan
  Future getWeather(String cityName) async {
    // membuat objek dari kelas http.Response
    // untuk mengambil data dari API OpenWeatherMap
    // await digunakan untuk menunggu proses selesai dilakukan
    http.Response response =
        await http.get(Uri.parse(apiName + cityName + apiKey));
    // mengubah data dari JSON menjadi Map
    var result = jsonDecode(response.body);
    // mengubah nilai dari variabel yang telah dibuat
    setState(() {
      this.temp = result['main']['temp'];
      this.description = result['weather'][0]['description'];
      this.currently = result['weather'][0]['main'];
      this.humidity = result['main']['humidity'];
      this.windSpeed = result['wind']['speed'];
    });
  }

  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    this.getWeather("Kayseri");
    getCurrentLocation();
  }

  getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }

  Icon cusIcon = Icon(Icons.search);
  Widget searchBar = Text("Cari Kota");
  void submitionSucess(String input) {
    getWeather(input);
    // set state untuk mengubah nama kota yang ditampilkan
    // pada saat pencarian sukses dilakukan oleh user
    setState(() {
      cityName = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: getCurrentLocation,
          icon: Icon(Icons.location_on),
        ),
        title: searchBar,
        centerTitle: true,
        backgroundColor: Colors.blue[100],
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.searchBar = TextField(
                      onSubmitted: (String input) {
                        submitionSucess(input);
                      },
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nama Kota",
                      ),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.searchBar = Text("Cari Kota");
                  }
                });
              },
              icon: cusIcon)
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "$formattedDate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "in $cityName",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null
                      ? (temp - 273.15).toStringAsFixed(0) + "\u00B0"
                      : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.blue[200],
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerThreeQuarters),
                    title: Text("Temperature"),
                    trailing: Text(temp != null
                        ? (temp - 273.15).toStringAsFixed(0) + "\u00B0"
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humidity"),
                    trailing: Text(
                        humidity != null ? humidity.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                    trailing: Text(
                        windSpeed != null ? windSpeed.toString() : "Loading"),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
