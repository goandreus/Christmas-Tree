import 'package:flutter/material.dart';

import 'ui/tree_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Tree',
      theme: ThemeData(
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        primarySwatch: Colors.blue,
     
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TreePage(),
    );
  }
}

