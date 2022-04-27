import 'package:app_07/components/custom_button.component.dart';
import 'package:app_07/components/custom_checkbox.component.dart';
import 'package:app_07/components/custom_dropdown.component.dart';
import 'package:app_07/components/custom_input.component.dart';
import 'package:app_07/components/custom_slider.component.dart';
import 'package:flutter/material.dart';

class CreateBankAccount extends StatefulWidget {
  @override
  _CreateBankAccount createState() => _CreateBankAccount();
}

class _CreateBankAccount extends State<CreateBankAccount> {
  GlobalKey<FormState> _key = new GlobalKey();
  String _dropdownSexController = 'Selecione',
      _dropdownSchoolController = 'Selecione',
      _resultado = "";
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
          callback: _generateResult(),
        ),
        _showResult()
      ],
    );
  }

  _generateResult() {
    _resultado =
        "Dados informados: \n Nome: ${_nameController.text}\n Idade: ${_ageController.text}\n Sexo: $_dropdownSexController\n Ensino: $_dropdownSchoolController\n Nota: ${_sliderController.round()}\n Brasileiro: $_checkboxController";
    setState(() {});
  }

  // ignore: non_constant_identifier_names
  _showResult() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: double.maxFinite,
      child: Text(
        _resultado,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
