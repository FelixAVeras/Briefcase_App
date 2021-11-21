import 'package:flutter/material.dart';
import 'package:briefcase/src/models/productos.dart';
import 'package:briefcase/src/helpers/db_products.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(this.prod);
  final ProductoModel prod;

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  ProductDetailPageState();

  DbConnProd db = DbConnProd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prod.nombre),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(child: Text('Detalle de Producto')),
      ),
    );
  }
}
