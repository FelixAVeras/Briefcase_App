import 'package:briefcase/src/helpers/db_helper.dart';

class Transaction {
  int id;
  String titleTransaction;
  double amountTransaction;
  String dateTransaction;

  Transaction(this.id, this.titleTransaction, this.amountTransaction,
      this.dateTransaction);

  Transaction.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    titleTransaction = map['titleTransaction'];
    amountTransaction = map['amountTransaction'];
    dateTransaction = map['dateTransaction'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnIdTransaction: id,
      DatabaseHelper.columnTitleTransaction: titleTransaction,
      DatabaseHelper.columnAmountTransaction: amountTransaction,
      DatabaseHelper.columnDateTransaction: dateTransaction
    };
  }
}
