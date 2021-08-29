import 'dart:io';

import 'package:flutter/material.dart';

import 'package:briefcase/src/helpers/db_helper.dart';
import 'package:briefcase/src/models/transaction.dart';
import 'package:briefcase/src/pages/categories/category_page.dart';
import 'package:briefcase/src/pages/home_page.dart';
import 'package:briefcase/src/pages/login_page.dart';
import 'package:briefcase/src/pages/transactions/transactionForm_page.dart';
import 'package:briefcase/src/pages/transactions/transactionsHistory_page.dart';
import 'package:briefcase/src/pages/widget/chart.dart';

void main() => runApp(Briefcase());

class Briefcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Briefcase',
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage()
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<TransactionModel> _userTransactions = [];
//   bool _showChart = false;

//   List<TransactionModel> get _recentTransactions {
//     DateTime lastDayOfPrevWeek = DateTime.now().subtract(Duration(days: 6));
//     lastDayOfPrevWeek = DateTime(
//         lastDayOfPrevWeek.year, lastDayOfPrevWeek.month, lastDayOfPrevWeek.day);
//     return _userTransactions.where((element) {
//       return element.txnDateTime.isAfter(
//         lastDayOfPrevWeek,
//       );
//     }).toList();
//   }

//   _MyHomePageState() {
//     _updateUserTransactionsList();
//   }

//   void _updateUserTransactionsList() {
//     Future<List<TransactionModel>> res =
//         DatabaseHelper.instance.getAllTransactions();

//     res.then((txnList) {
//       setState(() {
//         _userTransactions = txnList;
//       });
//     });
//   }

//   void _showChartHandler(bool show) {
//     setState(() {
//       _showChart = show;
//     });
//   }

//   Future<void> _addNewTransaction(
//       String title, double amount, DateTime chosenDate) async {
//     final newTxn = TransactionModel(
//       DateTime.now().millisecondsSinceEpoch.toString(),
//       title,
//       amount,
//       chosenDate,
//     );
//     int res = await DatabaseHelper.instance.insert(newTxn);

//     if (res != 0) {
//       _updateUserTransactionsList();
//     }
//   }

//   void _startAddNewTransaction(BuildContext context) {
//     showModalBottomSheet<dynamic>(
//       isScrollControlled: true,
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext bc) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.80,
//           decoration: new BoxDecoration(
//             color: Colors.white,
//             borderRadius: new BorderRadius.only(
//               topLeft: const Radius.circular(25.0),
//               topRight: const Radius.circular(25.0),
//             ),
//           ),
//           child: TransactionFormPage(_addNewTransaction),
//         );
//       },
//     );
//   }

//   Future<void> _deleteTransaction(String id) async {
//     int res =
//         await DatabaseHelper.instance.deleteTransactionById(int.tryParse(id));
//     if (res != 0) {
//       _updateUserTransactionsList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AppBar myAppBar = AppBar(
//       title: Text('Briefcase'),
//       backgroundColor: Colors.blue[800],
//       centerTitle: true,
//     );
//     MediaQueryData mediaQueryData = MediaQuery.of(context);
//     final bool isLandscape =
//         mediaQueryData.orientation == Orientation.landscape;

//     final double availableHeight = mediaQueryData.size.height -
//         myAppBar.preferredSize.height -
//         mediaQueryData.padding.top -
//         mediaQueryData.padding.bottom;

//     final double availableWidth = mediaQueryData.size.width -
//         mediaQueryData.padding.left -
//         mediaQueryData.padding.right;

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: myAppBar,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             if (isLandscape)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Show Chart",
//                     style: TextStyle(
//                       fontFamily: "Rubik",
//                       fontSize: 16.0,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                   Switch.adaptive(
//                     activeColor: Colors.amber[700],
//                     value: _showChart,
//                     onChanged: (value) => _showChartHandler(value),
//                   ),
//                 ],
//               ),
//             if (isLandscape)
//               _showChart
//                   ? myChartContainer(
//                       height: availableHeight * 0.8,
//                       width: 0.6 * availableWidth)
//                   : myTransactionListContainer(
//                       height: availableHeight * 0.8,
//                       width: 0.6 * availableWidth),
//             if (!isLandscape)
//               myChartContainer(
//                   height: availableHeight * 0.3, width: availableWidth),
//             if (!isLandscape)
//               myTransactionListContainer(
//                   height: availableHeight * 0.7, width: availableWidth),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//           child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue[800],
//             ),
//             child: Text('Briefcase',
//                 style: TextStyle(color: Colors.white, fontSize: 24)),
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Mi perfil'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           Divider(),
//           // ListTile(
//           //     leading: Icon(Icons.sync_alt),
//           //     title: Text('Transacciones'),
//           //     onTap: () => {
//           //           Navigator.of(context).pop(),
//           //           Navigator.push(
//           //               context,
//           //               MaterialPageRoute(
//           //                   builder: (context) => TransactionPage()))
//           //         }),
//           // Divider(),
//           ListTile(
//             leading: Icon(Icons.grid_view),
//             title: Text('Categorias'),
//             onTap: () => {
//               Navigator.of(context).pop(),
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => CategoryPage()))
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.check_circle),
//             title: Text('Metas'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           Divider(),
//           // ListTile(
//           //   leading: Icon(Icons.access_time),
//           //   title: Text('Historial'),
//           //   onTap: () => {
//           //     Navigator.of(context).pop(),
//           //     Navigator.push(context,
//           //         MaterialPageRoute(builder: (context) => HistoryPage()))
//           //   },
//           // ),
//           // Divider(),
//           ListTile(
//             leading: Icon(Icons.credit_card),
//             title: Text('Tarjetas y Cuentas'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Cerrar Sesión'),
//             onTap: () => {
//               Navigator.of(context).pop(),
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => LoginPage()))
//             },
//           ),
//         ],
//       )),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Platform.isIOS
//           ? Container()
//           : FloatingActionButton.extended(
//               icon: Icon(Icons.add),
//               label: Text('Nueva Transaccion'),
//               backgroundColor: Colors.blue[800],
//               onPressed: () => _startAddNewTransaction(context),
//             ),
//     );
//   }

//   Widget myChartContainer({double height, double width}) {
//     return Container(
//       height: height,
//       width: width,
//       child: Chart(_recentTransactions),
//     );
//   }

//   Widget myTransactionListContainer({double height, double width}) {
//     return Container(
//       height: height,
//       width: width,
//       child: TransactionHistoryPage(_userTransactions, _deleteTransaction),
//     );
//   }
// }
