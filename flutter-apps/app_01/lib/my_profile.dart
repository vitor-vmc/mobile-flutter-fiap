import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Perfil"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "* Vitor Machado de Campos - 24 Anos - RM87229 * \n\n * 3 anos atuando como engenheiro de software frontend",
            style: TextStyle(
                fontSize: 18,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
