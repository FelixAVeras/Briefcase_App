import 'package:briefcase/src/models/productos.dart';
import 'package:flutter/material.dart';

class ProductoList extends StatelessWidget {
  final List<ProductoModel> prod;
  ProductoList({Key key, this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prod == null ? 0 : prod.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => DetailWidget(trans[index])),
              // );
            },
            child: ListTile(
              title: Text(prod[index].prodNombre),
            ),
          )
        );
      }
    );
  }
}