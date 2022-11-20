import 'package:flutter/material.dart';
import 'package:flutter_shopping/widgets/card_home.dart';
import 'package:flutter_shopping/models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, description: 'Gula bukan sembarang gula'),
    Item(
        name: 'Salt',
        price: 2000,
        description: 'Tambahan Garam memperkaya rasa UMAMI dari makanan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: CardHome(item: item),
            );
          },
        ),
      ),
    );
  }
}
