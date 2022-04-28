import 'package:app_11/components/custom_button.component.dart';
import 'package:app_11/components/custom_checkbox.component.dart';
import 'package:app_11/components/custom_dropdown.component.dart';
import 'package:app_11/components/custom_input.component.dart';
import 'package:app_11/components/custom_slider.component.dart';
import 'package:flutter/material.dart';

import 'bank_account_form.dart';

class BankAccountForm extends StatefulWidget {
  @override
  _BankAccountForm createState() => _BankAccountForm();
}

class _BankAccountForm extends State<BankAccountForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  String _dropdownSexController = 'Selecione',
      _dropdownSchoolController = 'Selecione';
  bool _checkboxController = false;
  double _sliderController = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Criar conta Bancaria'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        CustomInput(label: 'nome', inputController: _nameController),
        CustomInput(label: 'idade', inputController: _ageController),
        CustomDropdown(
          label: 'sexo',
          dropdownController: _dropdownSexController,
          itemsList: <String>['Selecione', 'Masculino', 'Feminino'],
          callback: (String value) {
            setState(() {
              _dropdownSexController = value;
            });
          },
        ),
        CustomDropdown(
          label: 'Escolaridade',
          dropdownController: _dropdownSchoolController,
          itemsList: <String>[
            'Selecione',
            'Ensino Superior Completo',
            'Ensino Superior Incompleto',
            'Ensino Médio Completo',
            'Ensino Médio Incompleto',
            'Ensino Fundamental Completo',
            'Ensino Fundamental Incompleto'
          ],
          callback: (String value) {
            setState(() {
              _dropdownSchoolController = value;
            });
          },
        ),
        CustomSlider(
          label: '${_sliderController.round()}',
          callBack: (double value) {
            setState(() {
              _sliderController = value;
            });
          },
        ),
        CustomCheckBox(
          label: 'Brasileiro',
          checkboxController: _checkboxController,
          callback: (bool value) {
            setState(() {
              _checkboxController = value;
            });
          },
        ),
        CustomButton(
          label: 'Confirmar',
          callback: _openBankAccountResult(context),
        ),
      ],
    );
  }

  _openBankAccountResult(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return BankAccountResult(
          valueName: _nameController.text,
          valueAge: _ageController.text,
          valueSex: _dropdownSexController,
          valueSchool: _dropdownSchoolController,
          valueSlider: _sliderController,
          valueCheckbox: _checkboxController);
    }));
  }
}
