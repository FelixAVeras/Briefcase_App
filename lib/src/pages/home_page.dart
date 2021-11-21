import 'package:flutter/material.dart';
import 'package:briefcase/src/pages/store/store_page.dart';
import 'package:briefcase/src/pages/categories/category_page.dart';
import 'package:briefcase/src/pages/dashboard_page.dart';
import 'package:briefcase/src/pages/login_page.dart';
import 'package:briefcase/src/pages/perfil/profile_page.dart';
import 'package:briefcase/src/pages/products/product_page.dart';
import 'package:briefcase/src/pages/transactions/transaction_page.dart';

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
      body: _callPages(currentIndex),
      // body: DashboardPage(),
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
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text('Mi perfil'),
          //   onTap: () => {
          //     Navigator.of(context).pop(),
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ProfilePage())),
          //   },
          // ),
          // Divider(),
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
            leading: Icon(Icons.book),
            title: Text('Productos'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductPage()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.store_rounded),
            title: Text('Tienda'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StorePage()))
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.check_circle),
          //   title: Text('Metas'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          )
        ],
      )),
      bottomNavigationBar: _customBottomNavigationBar(),
    );
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.store_rounded), label: 'Tienda'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Perfil'),
      ],
      elevation: 15,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.blue[800],
      selectedFontSize: 18,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
    );
  }

  Widget _callPages(int currentPage) {
    switch (currentPage) {
      case 0:
        return DashboardPage();
      case 1:
        return ProfilePage();

      default:
        return DashboardPage();
    }
  }
}
