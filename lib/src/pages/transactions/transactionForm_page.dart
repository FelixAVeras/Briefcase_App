// import 'package:briefcase/src/helpers/db_helper.dart';
// import 'package:briefcase/src/models/transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// class TransactionFormPage extends StatefulWidget {
//   final Function _addTransaction;

//   TransactionFormPage(this._addTransaction);

//   @override
//   TransactionFormPageState createState() => TransactionFormPageState();
// }

// class TransactionFormPageState extends State<TransactionFormPage> {
//   final _titleController = TextEditingController();
//   final _amountController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _timeController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _titleFocus = FocusNode();
//   final _amountFocus = FocusNode();
//   final _dateFocus = FocusNode();
//   final _timeFocus = FocusNode();

//   bool _autoValidateToggle = false;
//   DateTime _selectedDate;
//   TimeOfDay _selectedTime;

//   TransactionFormPageState() {
//     _autoValidateToggle = false;
//     _selectedDate = DateTime.now();
//     _selectedTime = null;
//   }

//   Future<Null> _selectDate(BuildContext context) async {
//     final today = DateTime.now();
//     final DateTime pickedDate = await showDatePicker(
//       context: context,
//       initialDate: today,
//       firstDate: DateTime(1900, 1),
//       lastDate: today,
//     );
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//         _dateController.value =
//             TextEditingValue(text: DateFormat('d/M/y').format(pickedDate));
//       });
//     }
//   }

//   void _fieldFocusChange(
//       BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
//     currentFocus.unfocus();
//     FocusScope.of(context).requestFocus(nextFocus);
//   }

//   void _onSubmit() {
//     if (_formKey.currentState.validate()) {
//       final txnTitle = _titleController.text;
//       final txnAmount = double.parse(_amountController.text);
//       final txnDateTime = DateTime(_selectedDate.year, _selectedDate.month,
//           _selectedDate.day, _selectedTime.hour, _selectedTime.minute);

//       widget._addTransaction(
//         txnTitle,
//         txnAmount,
//         txnDateTime,
//       );
//       Navigator.of(context).pop();
//     } else {
//       _autoValidateToggle = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//           child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 Text(
//                   'En esta seccion puedes registrar tus transacciones ya ' +
//                       'sean ingresos o predidas.',
//                   style: TextStyle(fontSize: 14.0),
//                   textAlign: TextAlign.justify,
//                 ),
//                 SizedBox(height: 20.0),
//                 Flexible(
//                   fit: FlexFit.loose,
//                   child: GestureDetector(
//                     onTap: () => _selectDate(context),
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         controller: _dateController,
//                         focusNode: _dateFocus,
//                         keyboardType: TextInputType.datetime,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(25.0)),
//                           ),
//                           labelText: 'Date',
//                           hintText: 'Date of Transaction',
//                           prefixIcon: Icon(Icons.calendar_today),
//                           suffixIcon: Icon(Icons.arrow_drop_down),
//                         ),
//                         autovalidate: _autoValidateToggle,
//                         validator: (value) {
//                           if (value.isEmpty) return "Please select a date";
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _titleController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.title),
//                     labelText: 'Nombre Transaccion',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Este campo es obligatorio';
//                     }
//                     return null;
//                   },
//                   autovalidate: _autoValidateToggle,
//                   focusNode: _titleFocus,
//                   onFieldSubmitted: (_) =>
//                       _fieldFocusChange(context, _titleFocus, _amountFocus),
//                   textInputAction: TextInputAction.next,
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: _amountController,
//                     decoration: InputDecoration(
//                       labelText: 'Monto de la Transaccion',
//                       prefixIcon: Icon(Icons.local_atm),
//                     ),
//                     // onSaved: (val) =>
//                     //     setState(() => model.amountTransaction = val as int),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Este campo es obligatorio';
//                       }
//                       return null;
//                     }),
//                 SizedBox(height: 50.0),
//                 RaisedButton.icon(
//                     icon: Icon(Icons.save),
//                     label: Text(
//                       'Guardar',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     color: Colors.green,
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                     onPressed: _onSubmit)
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFormPage extends StatefulWidget {
  final Function _addTransaction;

  TransactionFormPage(this._addTransaction);

  @override
  TransactionFormPageState createState() => TransactionFormPageState();
}

class TransactionFormPageState extends State<TransactionFormPage> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _titleFocus = FocusNode();
  final _amountFocus = FocusNode();
  final _dateFocus = FocusNode();
  final _timeFocus = FocusNode();

  bool _autoValidateToggle = false;
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  _NewTransactionFormState() {
    _autoValidateToggle = false;
    _selectedDate = DateTime.now();
    _selectedTime = null;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final today = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(1900, 1),
      lastDate: today,
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.value =
            TextEditingValue(text: DateFormat('d/M/y').format(pickedDate));
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.value = TextEditingValue(
            text: DateFormat.jm().format(
          DateTime(
            _selectedDate.year,
            _selectedDate.month,
            _selectedDate.day,
            _selectedTime.hour,
            _selectedTime.minute,
          ),
        ));
      });
    }
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      final txnTitle = _titleController.text;
      final txnAmount = double.parse(_amountController.text);
      final txnDateTime = DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, _selectedTime.hour, _selectedTime.minute);

      widget._addTransaction(
        txnTitle,
        txnAmount,
        txnDateTime,
      );
      Navigator.of(context).pop();
    } else {
      _autoValidateToggle = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),

            // Title TextField
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titulo Transaccion',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(11.0)),
                ),
                prefixIcon: Icon(Icons.title),
                hintText: "Ej: Compra de Zapatos",
              ),
              validator: (value) {
                if (value.isEmpty) return "Este campo es obligatorio";
                return null;
              },
              autovalidate: _autoValidateToggle,
              focusNode: _titleFocus,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _titleFocus, _amountFocus),
              controller: _titleController,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20.0,
            ),

            // Amount TextField
            TextFormField(
              focusNode: _amountFocus,
              decoration: InputDecoration(
                labelText: 'Monto de la trasnsaccion',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(11.0)),
                ),
                prefixIcon: Icon(Icons.local_atm),
                hintText: "Ej: 1255.32",
              ),
              autovalidate: _autoValidateToggle,
              validator: (value) {
                RegExp regex = RegExp('[0-9]+(\.[0-9]+)?');
                if (!regex.hasMatch(value) || double.tryParse(value) == null)
                  return 'Ingrese un valor valido';
                return null;
              },
              controller: _amountController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),

            SizedBox(
              height: 20.0,
            ),

            // Date and Time Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Date TextField
                Flexible(
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dateController,
                        focusNode: _dateFocus,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          labelText: 'Fecha',
                          hintText: 'Fecha de la transaccion',
                          prefixIcon: Icon(Icons.calendar_today),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        autovalidate: _autoValidateToggle,
                        validator: (value) {
                          if (value.isEmpty) return "Este campo es obligatorio";
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10.0,
                ),
                // Time TextField
                Flexible(
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () => _selectTime(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _timeController,
                        focusNode: _timeFocus,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          labelText: 'Hora',
                          hintText: 'Hora de la Transaccion',
                          prefixIcon: Icon(Icons.schedule),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        autovalidate: _autoValidateToggle,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Seleccione una hora valida";
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 50.0,
            ),

            // Add Transaction Button
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: RaisedButton.icon(
                icon: Icon(Icons.save),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0)),
                label: Text(
                  'Guardar',
                  style: TextStyle(
                    fontFamily: "Rubik",
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.green[700],
                onPressed: _onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
