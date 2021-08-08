import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      padding: EdgeInsets.all(8.0),
      crossAxisCount: 2,
      children: [
        Card(
          child: ListTile(
              title: Text(
                'Ganancias',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('this is a description of the Ganancias',
                  textAlign: TextAlign.center)),
        ),
        Card(
          child: ListTile(
              title: Text('Perdidas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              subtitle: Text('this is a description of the Perdidas',
                  textAlign: TextAlign.center)),
        )
      ],
    ));
  }
}
