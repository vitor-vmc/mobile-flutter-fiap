import 'package:app_07/create_bank_account.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abertura conta bancaria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateBankAccount(),
    );
  }
}
