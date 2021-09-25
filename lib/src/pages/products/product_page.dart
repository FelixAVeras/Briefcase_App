import 'package:flutter/material.dart';
import 'package:briefcase/src/pages/products/product_add.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Crear producto'),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ProductAdd()),
          );
        },
      )
    );
  }
}