import 'package:briefcase/src/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(Briefcase());

class Briefcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Briefcase',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        // 'home': (BuildContext context) => HomePage()
      },
    );
  }
}
