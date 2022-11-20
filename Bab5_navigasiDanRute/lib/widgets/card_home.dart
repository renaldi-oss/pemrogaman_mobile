import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/item.dart';

class CardHome extends StatelessWidget {
  const CardHome({ Key? key, required this.item, }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: Text(item.name)),
            Expanded(
                child: Text(
              item.price.toString(),
              textAlign: TextAlign.end,
            ))
          ],
        ),
      ),
    );
  }
}