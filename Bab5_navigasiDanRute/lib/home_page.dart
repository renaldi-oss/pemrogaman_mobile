


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';
import 'item_page.dart';

final  namaController = TextEditingController();

final  priceController = TextEditingController();

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return MaterialApp(
        routes: {
          '/item' : (context) => ItemPage() ,
        },
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );

  }
}
class MyHomePage extends StatefulWidget{
   final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
  
}
class _MyHomePage extends State<MyHomePage>{
    final List<Item> items = [
    Item(name: 'Sugar' , price: 5000),
    Item(name: 'Salt' , price: 2000),
  ];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
     return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            
            Container(
              child: TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText : "Masukkan Nama"
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText : "Masukkan Price"
                ),
              ),
            ),
            
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                onPressed: (){
                  setState(() {
                    items.add(Item(name: namaController.text , price: int.parse(priceController.text)));
                  });
                },
                child: Text("Masuk",
                  style: TextStyle(color: Colors.white) ,
                ),
              ),
            ),

            Expanded(
              child: SizedBox(
                child:  ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: items.length,
                  itemBuilder: (context , index){ 
                    final item = items[index];
            
                    return InkWell(
                    child: xx(item: item),
                    onTap: (){
                        Navigator.pushNamed(context, '/item' , arguments: item);
                      },
                    );
                  },
                ), 
              )
            ),
          ],
        )
          
        
        
      ),
    );
 
    
  }
  
}

class xx extends StatelessWidget {
  const xx({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: Text(
              item.name,
              textAlign: TextAlign.start,
            )),
            Expanded(
              child: Text(
                item.price.toString(),
                textAlign: TextAlign.end,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}