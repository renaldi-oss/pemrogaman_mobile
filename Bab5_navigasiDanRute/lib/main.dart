import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home_page.dart';
import 'package:flutter_shopping/pages/item_page.dart';
import 'package:flutter_shopping/models/item.dart';

void main() {
  runApp(MaterialApp(
   initialRoute: '/',
    routes: <String, WidgetBuilder> {
      '/': (context) => HomePage(),
      '/item' : (context) => const ItemPage(),
    }
  ));
} 
