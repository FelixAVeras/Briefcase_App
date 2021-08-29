import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Categorias'),
          centerTitle: true,
          backgroundColor: Colors.blue[800]),
      body: Center(child: Text('Pantalla De Categoria')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
