import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function callback;

  CustomButton({
    @required this.label,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}
