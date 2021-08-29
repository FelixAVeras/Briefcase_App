import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

enum TransType { earning, expense }

class TransactionFormPage extends StatefulWidget {
  // TransactionFormPage();

  final Function _addTransaction;

  TransactionFormPage(this._addTransaction);

  @override
  TransactionFormPageState createState() => TransactionFormPageState();
}

class TransactionFormPageState extends State<TransactionFormPage> {
  // TransactionFormPageState();

  // TransactionModel model = TransactionModel();
  // DatabaseHelper dbHelper = DatabaseHelper();
  // final _addFormKey = GlobalKey<FormState>();
  // final format = DateFormat("dd-MM-yyyy");
  // final _transDateController = TextEditingController();
  // final _transNameController = TextEditingController();
  // String transType = 'earning';
  // final _amountController = TextEditingController();
  // TransType _transType = TransType.earning;

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

  TransactionFormPageState() {
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
                // SizedBox(height: 10.0),
                // Text(
                //   'Las transacciones se guardaran con la fecha' +
                //       ' actual en la que se ingrese.',
                //   style: TextStyle(
                //       fontSize: 14.0,
                //       color: Colors.grey[600],
                //       fontStyle: FontStyle.italic),
                //   textAlign: TextAlign.justify,
                // ),
                SizedBox(height: 20.0),
                // Text(
                //   'Fecha de Transaccion',
                //   style: TextStyle(fontSize: 16.0),
                //   textAlign: TextAlign.justify,
                // ),
                // DateTimeField(
                //     format: format,
                //     controller: _transDateController,
                //     onShowPicker: (context, currentValue) {
                //       return showDatePicker(
                //           context: context,
                //           initialDate: currentValue ?? DateTime.now(),
                //           firstDate: DateTime(1900),
                //           lastDate: DateTime(2100));
                //     },
                //     validator: (value) {
                //       if (value == null || value == '') {
                //         return 'Este campo es obligatorio';
                //       }
                //       return null;
                //     },
                //     onChanged: (value) {}),
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
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          labelText: 'Date',
                          hintText: 'Date of Transaction',
                          prefixIcon: Icon(Icons.calendar_today),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        autovalidate: _autoValidateToggle,
                        validator: (value) {
                          if (value.isEmpty) return "Please select a date";
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20.0),
                // Text('Tipo de Transaccion', style: TextStyle(fontSize: 16.0)),
                // ListTile(
                //   title: Text('Ingreso'),
                //   leading: Radio(
                //     value: TransType.earning,
                //     groupValue: _transType,
                //     onChanged: (TransType value) {
                //       setState(() {
                //         _transType = value;
                //         transType = 'earning';
                //       });
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: Text('Gasto'),
                //   leading: Radio(
                //     value: TransType.expense,
                //     groupValue: _transType,
                //     onChanged: (TransType value) {
                //       setState(() {
                //         _transType = value;
                //         transType = 'expense';
                //       });
                //     },
                //   ),
                // ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.title),
                    labelText: 'Nombre Transaccion',
                  ),
                  // onSaved: (val) =>
                  //     setState(() => model.titleTransaction = val),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  autovalidate: _autoValidateToggle,
                  focusNode: _titleFocus,
                  onFieldSubmitted: (_) =>
                      _fieldFocusChange(context, _titleFocus, _amountFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'Monto de la Transaccion',
                      prefixIcon: Icon(Icons.local_atm),
                    ),
                    // onSaved: (val) =>
                    //     setState(() => model.amountTransaction = val as int),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    }),
                SizedBox(height: 50.0),
                RaisedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    onPressed: _onSubmit)
              ],
            ),
          )
        ],
      )),
    );
  }

  // _onSubmit() {
  //   var form = _addFormKey.currentState;

  //   if (form.validate()) {
  //     form.save();
  //     print(model.titleTransaction);
  //   }
  // }
}
