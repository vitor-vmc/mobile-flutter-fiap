import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  Function callback;
  final TextEditingController inputController;
  CustomInput({
    @required this.label,
    @required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
