import 'package:briefcase/src/helpers/db_products.dart';
import 'package:briefcase/src/pages/products/product_add.dart';
import 'package:briefcase/src/pages/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:briefcase/src/models/productos.dart';
import 'package:briefcase/src/helpers/db_helper.dart';

class ProductPage extends StatefulWidget {
  @override
  ProductPageState createState() => ProductPageState();
}
class ProductPageState extends State<ProductPage> {
  DbConnProd dbconn = DbConnProd();
  List<ProductoModel> productoList;

  @override
  Widget build(BuildContext context) {
    if (productoList == null) {
      productoList = List<ProductoModel>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: new Container(
        child: FutureBuilder(
          future: loadListProd(),
          builder: (context, snapshot){
            return productoList.length > 0
            ? new ProductoList(prod: productoList)
            : new Center(child: Text('No hay datos que mostrar'));
          },
        ),
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

  Future loadListProd() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<List<ProductoModel>> futureTrans = dbconn.prod();
      futureTrans.then((productoList) {
        setState(() {
          this.productoList = productoList;
        });
      });
    });
  }
}