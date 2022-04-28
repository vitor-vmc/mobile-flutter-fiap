import 'package:app_12/pages/graduation.dart';
import 'package:app_12/pages/profile.dart';
import 'package:app_12/pages/work_experience.dart';
import 'package:flutter/material.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  int _currentPage = 0;

  final telas = [
    Center(child: Text('Meu Perfil')),
    Profile(),
    Graduation(),
    WorkExperience(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              accountName: Text('Vitor Campos'),
              accountEmail: Text('FIAP - RM87229'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.promoview.com.br/uploads/images/unnamed%2819%29.png'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Tela inicial'),
              trailing: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Dados Pessoais'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Formação Acadêmica e Cursos'),
              trailing: Icon(Icons.grade_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiências'),
              subtitle: Text('Experiências Profissionais'),
              trailing: Icon(Icons.lightbulb_outline),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App 12"),
      centerTitle: true,
      backgroundColor: Colors.indigo[600],
    );
  }
}
