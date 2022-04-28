import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String label;
  final Function callback;
  bool checkboxController;

  CustomCheckBox({
    @required this.label,
    @required this.checkboxController,
    @required this.callback,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.label),
      value: widget.checkboxController,
      onChanged: widget.callback,
    );
  }
}
