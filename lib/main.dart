import 'package:flutter/material.dart';

import 'package:briefcase/src/pages/home_page.dart';
import 'package:briefcase/src/pages/login_page.dart';

void main() => runApp(Briefcase());

class Briefcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Briefcase',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage()
      },
    );
  }
}
