import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  final dbHelper = DatabaseHelper.instance;
  List<TransactionModel> transactions = [];

  var now = new DateTime.now();
  // var formatter = new DateFormat('dd-MM-yyyy');
  // String formattedDate = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text('Briefcase - Historial'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: transactions.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == transactions.length) {
            return TextButton.icon(
                onPressed: () {
                  setState(() {
                    // _queryAll();
                  });
                },
                icon: Icon(Icons.refresh),
                label: Text('Refrescar Lista'));
          }
          return ListTile(
            title: Text(
                '${transactions[index].titleTransaction} - ${transactions[index].amountTransaction}'),
            subtitle: Text('${transactions[index].dateTransaction}'),
          );
        },
      ),
    );
  }

  // void _queryAll() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   transactions.clear();

  //   allRows.forEach((row) => transactions.add(TransactionModel.fromMap(row)));
  //   setState(() {});
  // }
}
