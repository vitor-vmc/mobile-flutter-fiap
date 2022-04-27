import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  String label;
  final Function callBack;

  CustomSlider({
    @required this.label,
    @required this.callBack,
  })

  
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double sliderController;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderController,
      min: 0,
      max: 100,
      divisions: 10,
      label: widget.label,
      onChanged: widget.callBack,
    );
  }
}
