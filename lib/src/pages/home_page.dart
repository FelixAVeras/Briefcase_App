import 'package:briefcase/src/pages/categories/category_page.dart';
import 'package:briefcase/src/pages/dashboard_page.dart';
import 'package:briefcase/src/pages/history_page.dart';
import 'package:briefcase/src/pages/login_page.dart';
import 'package:briefcase/src/pages/transactions/transaction_page.dart';
import 'package:briefcase/src/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomePage({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text('Briefcase'),
      ),
      // body: _loadPage(currentIndex),
      body: DashboardPage(),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[800],
            ),
            child: Text('Briefcase',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mi perfil'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.sync_alt),
              title: Text('Transacciones'),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionPage()))
                  }),
          Divider(),
          ListTile(
            leading: Icon(Icons.grid_view),
            title: Text('Categorias'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryPage()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Metas'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Historial'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Tarjetas y Cuentas'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Productos'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage()))
            },
          )
        ],
      )),
    );
  }

  // Widget _loadPage(int currentPage) {
  //   switch (currentPage) {
  //     case 0:
  //       return DashboardPage();
  //     case 1:
  //       return HistoryPage();

  //     default:
  //       return DashboardPage();
  //   }
  // }

  // Widget _customBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     currentIndex: currentIndex,
  //     onTap: (index) {
  //       setState(() {
  //         currentIndex = index;
  //       });
  //     },
  //     items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
  //       BottomNavigationBarItem(
  //           icon: Icon(Icons.access_time), label: 'Historial')
  //     ],
  //   );
  // }
}
