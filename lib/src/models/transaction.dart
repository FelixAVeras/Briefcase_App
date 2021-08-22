import 'package:briefcase/src/helpers/db_helper.dart';

class TransactionModel {
  int id;
  String titleTransaction;
  int amountTransaction;
  String dateTransaction;

  TransactionModel(
      {this.id,
      this.titleTransaction,
      this.amountTransaction,
      this.dateTransaction});

  // TransactionModel.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   titleTransaction = map['titleTransaction'];
  //   amountTransaction = map['amountTransaction'];
  //   dateTransaction = map['dateTransaction'];
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     DatabaseHelper.columnIdTransaction: id,
  //     DatabaseHelper.columnTitleTransaction: titleTransaction,
  //     DatabaseHelper.columnAmountTransaction: amountTransaction,
  //     DatabaseHelper.columnDateTransaction: dateTransaction
  //   };
  // }
}
