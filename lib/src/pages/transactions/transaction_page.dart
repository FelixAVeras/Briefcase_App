import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:briefcase/src/pages/transactions/transactionForm_page.dart';
import 'package:briefcase/src/pages/transactions/transactionsHistory_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionPage extends StatefulWidget {
  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  List<TransactionModel> _userTransactions = [];

  void _updateUserTransactionsList() {
    Future<List<TransactionModel>> res =
        DatabaseHelper.instance.getAllTransactions();

    res.then((txnList) {
      setState(() {
        _userTransactions = txnList;
      });
    });
  }

  Future<void> _addNewTransaction(
      String title, double amount, DateTime chosenDate) async {
    final newTxn = TransactionModel(
      DateTime.now().millisecondsSinceEpoch.toString(),
      title,
      amount,
      chosenDate,
    );
    int res = await DatabaseHelper.instance.insert(newTxn);

    if (res != 0) {
      _updateUserTransactionsList();
    }
  }

  Future<void> _deleteTransaction(String id) async {
    int res =
        await DatabaseHelper.instance.deleteTransactionById(int.tryParse(id));
    if (res != 0) {
      _updateUserTransactionsList();
    }
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.80,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: TransactionFormPage(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[800],
            // bottom: TabBar(
            //   tabs: [
            //     Tab(text: 'Nueva Transacciones'),
            //     Tab(text: 'Historial de trans.')
            //   ],
            //   indicatorWeight: 3,
            //   indicatorColor: Colors.white,
            //   unselectedLabelColor: Colors.white,
            // ),
            title: Text('Transacciones'),
          ),
          // body: TabBarView(children: [
          //   TransactionFormPage(_addNewTransaction),
          //   TransactionHistoryPage(_userTransactions, _deleteTransaction)
          // ]),
          body: TransactionHistoryPage(_userTransactions, _deleteTransaction),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Add New Transaction",
            onPressed: () => _startAddNewTransaction(context),
          ),
        ));
  }
}
