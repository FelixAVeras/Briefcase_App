class TransactionModel {
  int id;
  String titleTransaction;
  int amountTransaction;
  String dateTransaction;
  String typeTransaction;

  TransactionModel(
      {this.id,
      this.titleTransaction,
      this.amountTransaction,
      this.dateTransaction,
      this.typeTransaction});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titleTransaction': titleTransaction,
      'amountTransaction': amountTransaction,
      'dateTransaction': dateTransaction,
      'typeTransaction': typeTransaction
    };
  }

  @override
  String toString() {
    return 'Trans{id: $id, transName: $titleTransaction, amount: $amountTransaction} type: $typeTransaction';
  }
}
