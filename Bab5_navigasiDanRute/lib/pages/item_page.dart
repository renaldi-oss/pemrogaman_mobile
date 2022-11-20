import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/item.dart';
import 'package:flutter_shopping/widgets/card_item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CardItem(itemArgs: itemArgs),
            )
          ],
        ),
      ),
    );
  }
}