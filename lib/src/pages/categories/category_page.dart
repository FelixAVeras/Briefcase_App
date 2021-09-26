import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  Future<void> _openModal() async {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return SimpleDialog(title: Text('Nueva categoria'), children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_tree),
                  hintText: 'Ej: Ropa...',
                  labelText: 'Categoria',
                ),
                validator: (String value) {
                  if (value == null || value.isEmpty) {
                    return 'Rellene el campo';
                  }
                  return null;
                }),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Categoria creada');
                },
                child: const Text('Guardar'),
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 16.0),
              child: ElevatedButton(
                child: const Text('Cerrar'),
                onPressed: () => {Navigator.pop(context)},
              ))
        ]
            // decoration: new BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: new BorderRadius.only(
            //     topLeft: const Radius.circular(25.0),
            //     topRight: const Radius.circular(25.0),
            //   ),
            // ),
            );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
        backgroundColor: Colors.blue[800]),
      body: Center(child: Text('Pantalla De Categoria')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.add),
        label: Text('Crear categoria'),
        onPressed: () => _openModal(),
      ),
    );
  }
}