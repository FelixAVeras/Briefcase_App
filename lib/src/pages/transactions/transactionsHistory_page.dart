import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionHistoryPage extends StatelessWidget {
  final List<TransactionModel> _allTransactions;
  final Function _deleteTransaction;
  // TransactionHistoryPage({Key key, this.model}) : super(key: key);
  TransactionHistoryPage(this._allTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: model == null ? 0 : model.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       leading: model[index].typeTransaction == 'earning'
    //           ? Icon(Icons.attach_money)
    //           : Icon(Icons.money_off),
    //       title: Text(model[index].titleTransaction +
    //           ' - ' +
    //           model[index].amountTransaction.toString()),
    //       subtitle: Text(model[index].dateTransaction),
    //       onTap: Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => TransactionDetailPage(model[index]))),
    //     );
    //   },
    // );

    return LayoutBuilder(builder: (context, constraints) {
      return _allTransactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: constraints.maxHeight * 0.1,
                    child: Center(
                        child: Text(
                      "Sin datos que Mostrar",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontFamily: "Quicksand",
                      ),
                    ))),
              ],
            )
          : ListView.builder(
              itemCount: _allTransactions.length,
              itemBuilder: (context, index) {
                TransactionModel txn = _allTransactions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 5.0,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Container(
                          width: 70.0,
                          height: 50.0,
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.green[700],
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '\$${txn.txnAmount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          txn.txnTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('MMMM d, y -')
                              .add_jm()
                              .format(txn.txnDateTime),
                          // DateFormat.yMMMMd().format(txn.txnDateTime),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Theme.of(context).errorColor,
                          onPressed: () => _deleteTransaction(txn.txnId),
                          tooltip: "Delete Transaction",
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
