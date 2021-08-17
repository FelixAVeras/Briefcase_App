import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:briefcase/src/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  final dbHelper = DatabaseHelper.instance;
  List<TransactionModel> transactions = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController titleName = TextEditingController();
  TextEditingController amount = TextEditingController();

  void showMessageInSnack(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[800],
          title: Text('Nueva Transaccion'),
        ),
        body: SingleChildScrollView(
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nombre Transaccion',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Monto de la Transaccion',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          String name = titleName.text;
                          int qty = int.parse(amount.text);
                          _insert(name, qty);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()));
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _insert(title, quantity) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitleTransaction: title,
      DatabaseHelper.columnAmountTransaction: quantity
    };

    TransactionModel transactionModel = TransactionModel.fromMap(row);
    final id = await dbHelper.insert(transactionModel);
    showMessageInSnack('Registro insertado (ID: $id)');
  }
}
