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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final bool isLandscape =
        mediaQueryData.orientation == Orientation.landscape;

    final double availableHeight = mediaQueryData.size.height -
        mediaQueryData.padding.top -
        mediaQueryData.padding.bottom;

    final double availableWidth = mediaQueryData.size.width -
        mediaQueryData.padding.left -
        mediaQueryData.padding.right;

    Widget myTransactionListContainer({double height, double width}) {
      return Container(
        height: height,
        width: width,
        child: TransactionHistoryPage(_userTransactions, _deleteTransaction),
      );
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[800],
            title: Text('Transacciones'),
          ),
          // body: TransactionHistoryPage(_userTransactions, _deleteTransaction),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: FloatingActionButton.extended(
          //   icon: Icon(Icons.add),
          //   label: Text('Nueva Transaccion'),
          //   backgroundColor: Colors.blue[800],
          //   onPressed: () => _startAddNewTransaction(context),
          // ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (isLandscape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Show Chart",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 16.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                if (isLandscape)
                  myTransactionListContainer(
                      height: availableHeight * 0.8,
                      width: 0.6 * availableWidth),
                if (!isLandscape)
                  myTransactionListContainer(
                      height: availableHeight * 0.7, width: availableWidth),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add),
            label: Text('Nueva Transaccion'),
            backgroundColor: Colors.blue[800],
            onPressed: () => _startAddNewTransaction(context),
          ),
        ));
  }
}
