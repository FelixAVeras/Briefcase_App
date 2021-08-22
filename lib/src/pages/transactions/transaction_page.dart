import 'package:briefcase/src/pages/transactions/transactionForm_page.dart';
import 'package:briefcase/src/pages/transactions/transactionsHistory_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionPage extends StatefulWidget {
  @override
  TransactionPageState createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[800],
            bottom: TabBar(
              tabs: [
                Tab(text: 'Nueva Transacciones'),
                Tab(text: 'Historial de trans.')
              ],
              indicatorWeight: 3,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
            ),
            title: Text('Transacciones'),
          ),
          body: TabBarView(
              children: [TransactionFormPage(), TransactionHistoryPage()]),
        ));
  }
}
