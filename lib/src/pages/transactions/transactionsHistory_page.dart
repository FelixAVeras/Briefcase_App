import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  final List<TransactionModel> model;
  TransactionHistoryPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model == null ? 0 : model.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: model[index].typeTransaction == 'earning'
              ? Icon(Icons.attach_money)
              : Icon(Icons.money_off),
          title: Text(model[index].titleTransaction +
              ' - ' +
              model[index].amountTransaction.toString()),
          subtitle: Text(model[index].dateTransaction),
          // onTap: Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => TransactionDetailPage(model[index]))),
        );
      },
    );
  }
}
