import 'package:app_13/pages/work_experience.dart';
import 'package:flutter/material.dart';
import 'graduation.dart';
import 'profile.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  int _currentPage = 0;

  final tabs = [
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
        body: tabs[_currentPage],
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App 13"),
      centerTitle: true,
      backgroundColor: Colors.teal[600],
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _bottomNavigationBarItem('Home', Icons.home),
        _bottomNavigationBarItem('Pessoal', Icons.person),
        _bottomNavigationBarItem('Formação', Icons.school),
        _bottomNavigationBarItem('Experiência', Icons.work),
      ],
      onTap: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  _bottomNavigationBarItem(label, icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
