import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

enum TransType { earning, expense }

class TransactionFormPage extends StatefulWidget {
  TransactionFormPage();

  @override
  TransactionFormPageState createState() => TransactionFormPageState();
}

class TransactionFormPageState extends State<TransactionFormPage> {
  TransactionFormPageState();

  DatabaseHelper dbHelper = DatabaseHelper();
  final _addFormKey = GlobalKey<FormState>();
  final format = DateFormat("dd-MM-yyyy");
  final _transDateController = TextEditingController();
  final _transNameController = TextEditingController();
  String transType = 'earning';
  final _amountController = TextEditingController();
  TransType _transType = TransType.earning;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addFormKey,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'En esta seccion puedes registrar tus transacciones ya ' +
                      'sean ingresos o predidas.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Las transacciones se guardaran con la fecha' +
                      ' actual en la que se ingrese.',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Fecha de Transaccion',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.justify,
                ),
                DateTimeField(
                    format: format,
                    controller: _transDateController,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          initialDate: currentValue ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                    },
                    onChanged: (value) {}),
                SizedBox(height: 20.0),
                Text('Tipo de Transaccion', style: TextStyle(fontSize: 16.0)),
                ListTile(
                  title: Text('Ingreso'),
                  leading: Radio(
                    value: TransType.earning,
                    groupValue: _transType,
                    onChanged: (TransType value) {
                      setState(() {
                        _transType = value;
                        transType = 'earning';
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Gasto'),
                  leading: Radio(
                    value: TransType.expense,
                    groupValue: _transType,
                    onChanged: (TransType value) {
                      setState(() {
                        _transType = value;
                        transType = 'expense';
                      });
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _transNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre Transaccion',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  // onSaved: (val) => setState(
                  //     () => transactionModel.titleTransaction = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Monto de la Transaccion',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  // onSaved: (val) => setState(() => transactionModel
                  //     .amountTransaction = val as int)
                ),
                SizedBox(height: 100.0),
                ElevatedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.green[700],
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 100.0)),
                    onPressed: () {
                      if (_addFormKey.currentState.validate()) {
                        _addFormKey.currentState.save();
                        final initDB = dbHelper.initDB();

                        initDB.then((db) async {
                          await dbHelper.insertTrans(TransactionModel(
                              titleTransaction: _transNameController.text,
                              dateTransaction: _transDateController.text,
                              typeTransaction: transType,
                              amountTransaction:
                                  int.parse(_amountController.text)));
                        });
                        Navigator.pop(context);
                      }
                    })
              ],
            ),
          )
        ],
      )),
    );
    // return SingleChildScrollView(
    //     child: Column(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(10.0),
    //       child: Column(
    //         children: [
    //           Text(
    //             'En esta seccion puedes registrar tus transacciones ya ' +
    //                 'sean ingresos o predidas.',
    //             style: TextStyle(fontSize: 14.0),
    //             textAlign: TextAlign.justify,
    //           ),
    //           SizedBox(height: 10.0),
    //           Text(
    //             'Las transacciones se guardaran con la fecha' +
    //                 ' actual en la que se ingrese.',
    //             style: TextStyle(
    //                 fontSize: 14.0,
    //                 color: Colors.grey[600],
    //                 fontStyle: FontStyle.italic),
    //             textAlign: TextAlign.justify,
    //           ),
    //           SizedBox(height: 20.0),
    //           SizedBox(height: 20.0),
    //           TextFormField(
    //             decoration: InputDecoration(
    //               labelText: 'Nombre Transaccion',
    //             ),
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Este campo es obligatorio';
    //               }
    //               return null;
    //             },
    //             // onSaved: (val) => setState(
    //             //     () => transactionModel.titleTransaction = val),
    //           ),
    //           SizedBox(height: 20.0),
    //           TextFormField(
    //             keyboardType: TextInputType.number,
    //             decoration: InputDecoration(
    //               labelText: 'Monto de la Transaccion',
    //             ),
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Este campo es obligatorio';
    //               }
    //               return null;
    //             },
    //             // onSaved: (val) => setState(() => transactionModel
    //             //     .amountTransaction = val as int)
    //           ),
    //           SizedBox(height: 100.0),
    //           ElevatedButton.icon(
    //               icon: Icon(Icons.save),
    //               label: Text('Guardar'),
    //               style: ElevatedButton.styleFrom(
    //                   onPrimary: Colors.white,
    //                   primary: Colors.green[700],
    //                   padding: EdgeInsets.symmetric(
    //                       vertical: 10.0, horizontal: 100.0)),
    //               onPressed: () {
    //                 // print(transactionModel.titleTransaction);

    //                 // String name = titleName.text;
    //                 // int qty = int.parse(amount.text);
    //                 // _insert(name, qty);
    //                 // Navigator.push(
    //                 //     context,
    //                 //     MaterialPageRoute(
    //                 //         builder: (context) => DashboardPage()));
    //               })
    //         ],
    //       ),
    //     )
    //   ],
    // ));
  }
}
