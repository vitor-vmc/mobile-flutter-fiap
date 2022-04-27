import 'package:app_10/currency_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Conversor Moedas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CurrencyConverter());
  }
}
