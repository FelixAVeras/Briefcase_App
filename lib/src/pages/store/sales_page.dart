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
        // appBar: AppBar(
        //   title: Text('Products'),
        //   centerTitle: true,
        //   backgroundColor: Colors.blue[800],
        // ),
        body: Form(
          key: _addFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  //   child: Column(
                  //     children: <Widget>[
                  //       Text('Transaction Date'),
                  //       DateTimeField(
                  //         format: format,
                  //         controller: _transDateController,
                  //         onShowPicker: (context, currentValue) {
                  //           return showDatePicker(
                  //               context: context,
                  //               firstDate: DateTime(1900),
                  //               initialDate: currentValue ?? DateTime.now(),
                  //               lastDate: DateTime(2100));
                  //         },
                  //         onChanged: (value) {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Text(
                  //   'Todas las transacciones se guardaran con la fecha y hora actual en la que se registre.',
                  //   style: TextStyle(
                  //       fontSize: 16.0,
                  //       fontStyle: FontStyle.italic,
                  //       color: Colors.grey[600]),
                  //   textAlign: TextAlign.justify,
                  // ),
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
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  //   child: Column(
                  //     children: <Widget>[
                  //       TextFormField(
                  //         controller: _amountController,
                  //         decoration: const InputDecoration(
                  //             prefixIcon: Icon(Icons.local_atm_rounded),
                  //             labelText: 'Monto de la Transaccion',
                  //             border: OutlineInputBorder()),
                  //         keyboardType: TextInputType.number,
                  //         validator: (value) {
                  //           if (value.isEmpty) {
                  //             return 'Por favor ingrese un monto valido';
                  //           }
                  //           return null;
                  //         },
                  //         onChanged: (value) {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 60.0),
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
