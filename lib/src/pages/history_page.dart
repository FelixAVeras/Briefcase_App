import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Briefcase - Historial'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
              title: Text('Elemento 1 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 2 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 3 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 4 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 5 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 6 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 7 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 8 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 9 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
          Divider(),
          ListTile(
              title: Text('Elemento 10 - \$199.99'),
              subtitle: Text('Fecha 12/12/2020'),
              // trailing: Icon(Icons.more_vert),
              onTap: () => {}),
        ],
      ),
    );
  }
}
