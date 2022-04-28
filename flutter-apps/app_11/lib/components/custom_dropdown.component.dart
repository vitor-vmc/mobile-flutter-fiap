import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  String dropdownController;
  final Function callback;
  final List<String> itemsList;

  CustomDropdown({
    @required this.label,
    @required this.dropdownController,
    @required this.itemsList,
    @required this.callback,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: DropdownButton<String>(
          value: widget.dropdownController,
          items: widget.itemsList.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: widget.callback),
    );
  }
}
