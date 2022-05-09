import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextModifier extends StatefulWidget {
  @override
  State<TextModifier> createState() => _TextModifierState();
}

class _TextModifierState extends State<TextModifier> {
  bool _isDay = true;
  bool _isSmall = false;
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: _title(),
      body: _container(),
    ));
  }

  _setSharedPreference(key, value) async {
    if (_isSaving) return;
    _isSaving = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value.toString());
    _isSaving = false;
  }

  _title() {
    return AppBar(title: Text("Modificador de texto"), centerTitle: true);
  }

  _container() {
    return (Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          _rowSwitchs(),
          _textVisualization(
              _isDay ? Colors.white : Colors.blue[900], _isSmall ? 10.0 : 18.0),
        ],
      ),
    ));
  }

  _rowSwitchs() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _isDaySwitch(),
        _isSmallSwitch(),
      ],
    ));
  }

  _isDaySwitch() {
    return Row(
      children: [
        Text('Dia'),
        Switch(
          value: _isDay,
          onChanged: (value) {
            setState(() {
              _isDay = value;
              _setSharedPreference("isDay", value);
            });
          },
        ),
      ],
    );
  }

  _isSmallSwitch() {
    return Row(
      children: [
        Text('Pequeno'),
        Switch(
          value: _isSmall,
          onChanged: (value) {
            setState(() {
              _isSmall = value;
              _setSharedPreference("isSmall", value);
            });
          },
        ),
      ],
    );
  }

  _textVisualization(currentColor, currentFontSize) {
    return (Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      color: currentColor,
      child: Text('“Hakuna Matata.” (Vida Longa) – O Rei Leão (1994)',
          style: TextStyle(fontSize: currentFontSize)),
    ));
  }
}
