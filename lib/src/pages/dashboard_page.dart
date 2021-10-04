import 'package:briefcase/src/models/transaction.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<TransactionModel> _userTransactions = [];
  bool _showChart = false;

  List<TransactionModel> get _recentTransactions {
    DateTime lastDayOfPrevWeek = DateTime.now().subtract(Duration(days: 6));
    lastDayOfPrevWeek = DateTime(
        lastDayOfPrevWeek.year, lastDayOfPrevWeek.month, lastDayOfPrevWeek.day);
    return _userTransactions.where((element) {
      return element.txnDateTime.isAfter(
        lastDayOfPrevWeek,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                          title: Text(
                            'Balance Actual',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'this is a description of the Ganancias',
                              textAlign: TextAlign.center)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                          title: Text(
                            'Ganancias',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'this is a description of the Ganancias',
                              textAlign: TextAlign.center)),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                          title: Text(
                            'Perdidas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'this is a description of the Ganancias',
                              textAlign: TextAlign.center)),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
