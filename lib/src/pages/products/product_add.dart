import 'package:flutter/material.dart';
import 'package:briefcase/src/helpers/db_products.dart';
import 'package:briefcase/src/models/productos.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductAddState();
}

class ProductAddState extends State<ProductAdd> {
  DbConnProd dbconn = DbConnProd();
  final _formKey = GlobalKey<FormState>();
  final productoName = TextEditingController();
  final productoprecio = TextEditingController();
  final productocosto = TextEditingController();
  final productocategoria = TextEditingController();
  final productodescripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agregar Producto'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: new Container(
          child: (SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.book),
                      hintText: 'Producto (Obligatorio)',
                      labelText: 'Nombre',
                    ),
                    controller: productoName,
                    validator: (String value) {
                      if (value == null) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.paid_outlined),
                      hintText: '0',
                      labelText: 'Precio unitario',
                    ),
                    controller: productoprecio,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value == null) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.paid_outlined),
                      hintText: '0',
                      labelText: 'Costo unitario',
                    ),
                    controller: productocosto,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value == null) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.grid_view),
                      hintText: 'Sin categoria',
                      labelText: 'Categoria',
                    ),
                    controller: productocategoria,
                    validator: (String value) {
                      if (value == null) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.menu_book_rounded),
                      hintText: 'Descripcion (opcional)',
                      labelText: 'Descripcion',
                    ),
                    controller: productodescripcion,
                    validator: (String value) {
                      if (value == null) {
                        return 'Rellene el campo';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: Size(150, 50),
                    padding: EdgeInsets.only(
                        left: 100, right: 100, top: 15, bottom: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onPressed: () {
                  print('Producto creado');

                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    final initDB = dbconn.initDB();
                    initDB.then((db) async {
                      await dbconn.insertProducto(ProductoModel(
                          nombre: productoName.text,
                          precioUnitario: int.parse(productoprecio.text),
                          costoUnitario: int.parse(productocosto.text),
                          categoria: productocategoria.text,
                          descripcion: productodescripcion.text));
                    });

                    Navigator.pop(context);
                  }
                },
                child: const Text('Crear Producto'),
              ),
            ]),
          ))),
        ));
  }
}
