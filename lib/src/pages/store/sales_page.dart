import 'package:briefcase/src/helpers/db_products.dart';
import 'package:briefcase/src/pages/products/product_add.dart';
import 'package:briefcase/src/pages/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:briefcase/src/models/productos.dart';
import 'package:briefcase/src/helpers/db_helper.dart';

class SalesPage extends StatefulWidget {
  @override
  SalesPageState createState() => SalesPageState();
}

class SalesPageState extends State<SalesPage> {
  DbConnProd dbconn = DbConnProd();

  final _addFormKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _addFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _customerNameController,
                          decoration: const InputDecoration(
                              hintText: 'Pedro Martinez',
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nombre del Cliente',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nombre cliente, No puede estar vacio';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        // OutlinedButton(
                        //     child: Text('Agregar Productos'),
                        //     style: OutlinedButton.styleFrom(
                        //         padding: EdgeInsets.only(
                        //             left: 60, right: 60, top: 15, bottom: 15)),
                        //     onPressed: () {
                        //       // _chooseModalSheet(context);
                        //     })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save),
          label: Text('Guardar'),
          backgroundColor: Colors.teal,
          onPressed: () {
            // if (_addFormKey.currentState.validate()) {
            //   _addFormKey.currentState.save();
            //   final initDB = dbconn.initDB();
            //   initDB.then((db) async {
            //     await dbconn.insertTrans(TransactionModel(
            //         currentDate: currentDatetime,
            //         description: _transNameController.text,
            //         transType: transType,
            //         amount: int.parse(_amountController.text)));
            //   });

            //   Navigator.pop(context);
            // }
          },
        ));
  }
}
