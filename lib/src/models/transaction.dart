class TransactionModel {
  String id;
  String titleTransaction;
  double amountTransaction;
  DateTime dateTransaction;

  String get txnId => id;
  String get txnTitle => titleTransaction;
  double get txnAmount => amountTransaction;
  DateTime get txnDateTime => dateTransaction;

  TransactionModel(this.id, this.titleTransaction, this.amountTransaction,
      this.dateTransaction);

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
