import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "BAB 3 KONVERTER SUHU"),
      /*
      Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
          body: 
          
          Container(
            margin: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              Container(
                child: TextFormField(
                
                decoration: InputDecoration(
                hintText: "Masukkan Suhu Dalam Celcius",
                ),
                inputFormatters: <TextInputFormatter> [
                FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.amberAccent),
                margin: EdgeInsets.only(top : 200),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                Column(
                
                  children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.cyanAccent),
                    margin: EdgeInsets.only(right: 10),
                    child: Text("Suhu Dalam Kelvin",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.lightGreen),
                    child: Text(" 150",
                    style: TextStyle(fontSize: 20)),
                  )

                ],),
                Column( children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.cyanAccent),
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Suhu dalam Reamur",
                    style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.lightGreen),
                    child: Text("200",
                    style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],)

              ],),
              ),
              Container(
                margin: EdgeInsets.only(top : 230),
                width: 400,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                  ),
                  child: Text("Konversi Suhu",
                    style: TextStyle(
                      color : Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),

              )
              
            ],) 
            
            
          ),
        )
      */
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _inputUser = 0;
  double _kevin = 0;
  double _reamur = 0;

  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void conversion() {
    setState(() {
      _reamur = (4 / 5) * _inputUser;
      _kevin = _inputUser + 273.15;
    });
  }

  void xx() {
    setState(() {
      _inputUser = double.parse(myController.text);
      conversion();
    });
  }

  @override
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Container(
                child: Input(myController: myController),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "Suhu Dalam Kelvin",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(_kevin.toStringAsFixed(2),
                              style: TextStyle(fontSize: 40)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Suhu dalam Reamur",
                              style: TextStyle(fontSize: 20)),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            _reamur.toStringAsFixed(2),
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Convert(konvertHandler: xx),
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    required this.konvertHandler,
  }) : super(key: key);

  final Function konvertHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 230),
      width: 400,
      child: TextButton(
        onPressed: () {
          konvertHandler();
        },
        style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
        child: Text(
          "Konversi Suhu",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        /*
        onPressed: 
        
        () {
          /*
          setState(() {
              _inputUser = double.parse(myController.text);
              conversion();
          });
          */
        },
        */
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        hintText: "Masukkan Suhu Dalam Celcius",
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
    );
  }
}
