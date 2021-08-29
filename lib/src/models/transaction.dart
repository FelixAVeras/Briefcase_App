class TransactionModel {
  // int id;
  // String titleTransaction;
  // int amountTransaction;
  // String dateTransaction;
  // String typeTransaction;

  String id;
  String titleTransaction;
  double amountTransaction;
  DateTime dateTransaction;

  String get txnId => id;
  String get txnTitle => titleTransaction;
  double get txnAmount => amountTransaction;
  DateTime get txnDateTime => dateTransaction;

  TransactionModel(
    this.id,
    this.titleTransaction,
    this.amountTransaction,
    this.dateTransaction,
    // this.typeTransaction
  );

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'titleTransaction': titleTransaction,
  //     'amountTransaction': amountTransaction,
  //     'dateTransaction': dateTransaction,
  //     'typeTransaction': typeTransaction
  //   };
  // }

  // @override
  // String toString() {
  //   return 'Trans{id: $id, transName: $titleTransaction, amount: $amountTransaction} type: $typeTransaction';
  // }

  TransactionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    titleTransaction = map['title'];
    amountTransaction = map['amount'];
    dateTransaction = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': int.tryParse(id),
      'title': titleTransaction,
      'amount': amountTransaction,
      'date': dateTransaction.toIso8601String()
    };
    if (id != null) {
      map['id'] = int.tryParse(id);
    }

    return map;
  }
}
