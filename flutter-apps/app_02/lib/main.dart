import 'package:app_02/contator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Contador(),
    );
  }
}
