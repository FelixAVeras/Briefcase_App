import 'package:flutter/material.dart';

class TransactionFormPage extends StatefulWidget {
  @override
  TransactionFormPageState createState() => TransactionFormPageState();
}

class TransactionFormPageState extends State<TransactionFormPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                // onSaved: (val) => setState(
                //     () => transactionModel.titleTransaction = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Monto de la Transaccion',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
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
                    // print(transactionModel.titleTransaction);

                    // String name = titleName.text;
                    // int qty = int.parse(amount.text);
                    // _insert(name, qty);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DashboardPage()));
                  })
            ],
          ),
        )
      ],
    ));
  }
}
