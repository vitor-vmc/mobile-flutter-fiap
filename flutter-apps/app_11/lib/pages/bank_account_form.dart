import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BankAccountResult extends StatelessWidget {
  String valueName;
  String valueAge;
  String valueSex;
  String valueSchool;
  double valueSlider;
  bool valueCheckbox;

  BankAccountResult({
    @required this.valueName,
    @required this.valueAge,
    @required this.valueSex,
    @required this.valueSchool,
    @required this.valueSlider,
    @required this.valueCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Informados'),
        backgroundColor: Colors.indigo[600],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nome: $valueName"),
            Text("Idade: $valueAge"),
            Text("Sexo: $valueSex"),
            Text("Escolaridade: $valueSchool"),
            Text("Valor do Slider: $valueSlider"),
            Text("Brasileiro: $valueCheckbox"),
          ],
        ));
  }
}
