import 'package:flutter/material.dart';

class ProductAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: (Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.book),
              hintText: 'Producto (Obligatorio)',
              labelText: 'Nombre',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              // icon: Icon(Icons.paid_outlined),
              hintText: '0',
              labelText: 'Precio unitario',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              // icon: Icon(Icons.paid_outlined),
              hintText: '0',
              labelText: 'Costo unitario',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.grid_view),
              hintText: 'Sin categoria',
              labelText: 'Categoria',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.menu_book_rounded),
              hintText: 'Descripcion (opcional)',
              labelText: 'Descripcion',
            ),
          ),
          SizedBox(height: 50.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(150, 50),
                padding:
                    EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            onPressed: () {},
            child: const Text('Crear Producto'),
          ),
        ]),
      )),
    );
  }
}
