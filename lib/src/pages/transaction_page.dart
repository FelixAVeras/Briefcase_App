import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nueva Transaccion'),
      ),
      body: Column(
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
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Monto de la Transaccion',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 100.0),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 400.0,
                  child: OutlineButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Guardar Cambios'),
                    onPressed: () => {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
